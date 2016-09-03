package org.calvequi.springaop;

import org.calvequi.springaop.service.UserService;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class SpringAOPTest {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext();
		ctx.register(AspectConfig.class);
		ctx.refresh();
		UserService us = ctx.getBean(UserService.class);
		us.multiply(10, 5);
		ctx.close();
	}
	
}
