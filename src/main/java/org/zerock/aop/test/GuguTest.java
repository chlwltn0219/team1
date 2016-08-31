package org.zerock.aop.test;

import org.springframework.context.support.GenericXmlApplicationContext;

public class GuguTest {
	
	public static void main(String[] args) {
		
		GenericXmlApplicationContext ctx = 
				new GenericXmlApplicationContext("file:src/main/webapp/WEB-INF/spring/root-context.xml");
		
		Gugu gugu = ctx.getBean(Gugu.class);
		
		gugu.gugudan(9);
		
		System.out.println("Program End...");
		
	}
	
}
