package org.zerock.aop.test;

import org.springframework.stereotype.Component;

@Component
public class Gugu {
	
	public void gugudan(int dan) {
		
		int[] arr = new int[9];
		
		for(int i=1; i<10; i++) {
			arr[i-1] = dan * (i);
		}
		
	}
	
}
