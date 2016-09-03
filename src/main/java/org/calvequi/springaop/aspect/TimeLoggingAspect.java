package org.calvequi.springaop.aspect;

import java.util.Date;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class TimeLoggingAspect {
	@Before("execution(* org.calvequi.springaop.service.*.*(..))")
	public void logBefore() {
		System.out.println("@Before:" + new Date());
	}

	@After("execution(* org.calvequi.springaop.service.*.*(..))")
	public void logAfter() {
		System.out.println("@After:" + new Date());
	}

	@AfterThrowing(pointcut = "execution(* org.calvequi.springaop.service.*.*(..))", throwing = "exception")
	public void logAfterThrowing(Exception exception) {
		System.out.println("@@AfterThrowing:" + new Date());
	}
	
	@Around("execution(* org.calvequi.springaop.service.*.*(..))")
	public void userAdvice(ProceedingJoinPoint joinPoint) throws Throwable{
		System.out.println("@Around: Before calculation-"+ new Date());
		joinPoint.proceed();
		System.out.println("@Around: After calculation-"+ new Date());
	}
	
}
