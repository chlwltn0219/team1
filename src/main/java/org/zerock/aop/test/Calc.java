package org.zerock.aop.test;

import org.springframework.stereotype.Component;

@Component
public class Calc {
	
	public int add(int x, int y) {
		System.out.println(x + y);
		return x + y;
	}
	
	public int subtract(int x, int y) {
		System.out.println(x - y);
		return x - y;
	}
	
}
