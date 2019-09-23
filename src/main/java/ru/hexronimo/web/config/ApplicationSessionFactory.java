package ru.hexronimo.web.config;
 
import java.util.Properties;
import java.net.URI;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration 
// @PropertySource("classpath:database.properties")
//I will not use it this time, but if needed, it should be placed under /recourses
@EnableTransactionManagement
public class ApplicationSessionFactory {
 
    @Bean
    public LocalSessionFactoryBean sessionFactory() {
    	try {
    		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
            sessionFactory.setDataSource(getDataSource());
            sessionFactory.setPackagesToScan(new String[] {"ru.hexronimo.web.model"});
            sessionFactory.setHibernateProperties(hibernateProperties());
	        return sessionFactory;  
    	} catch(Exception e) {
    		System.out.println("ERROR: " + e.getMessage());
    		e.printStackTrace();
    	}
    	return null;
    }
    
	@Bean
	public DataSource getDataSource() {
		URI dbUri = new URI(System.getenv("DATABASE_URL"));
		String username = dbUri.getUserInfo().split(":")[0];
		String password = dbUri.getUserInfo().split(":")[1];
		String dbUrl = "jdbc:postgresql://" + dbUri.getHost() + ':' + dbUri.getPort() + dbUri.getPath()
						+ "?sslmode=require";
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
	    dataSource.setDriverClassName("org.postgresql.Driver");
	    dataSource.setUrl(dbUrl);
	    dataSource.setUsername(username);
	    dataSource.setPassword(password);	 
	    return dataSource;
	}
    
    private static Properties hibernateProperties() {    	
    		Properties props = new Properties();   	
			props.setProperty("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
			props.setProperty("hibernate.show_sql", "true");
			//props.setProperty("hibernate.connection.pool_size", "4");
			//props.setProperty("hibernate.current_session_context_class", "thread");	
		return props; 
    }
    
    @Bean
    public HibernateTransactionManager getTransactionManager() {
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        transactionManager.setSessionFactory(sessionFactory().getObject());
        return transactionManager;
    }
}
