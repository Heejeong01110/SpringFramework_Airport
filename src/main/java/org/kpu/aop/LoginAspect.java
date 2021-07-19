package org.kpu.aop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.kpu.myweb.domain.CustomerVO;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoginAspect {
	
	    //@Around("execution(* org.kpu.myweb.service.*.*(..))")  
		@Around("execution(* org.kpu.myweb.service.*.*(..))")  
	    public Object aroundMethod(ProceedingJoinPoint pjp) throws Throwable {
			Object result = null;
			try {
				System.out.println("[AroundMethod Before] : 메소드 호출 전");
	            long start = System.currentTimeMillis();
	            Signature sig = pjp.getSignature();
		        System.out.println(" 호출된 메소드 :" + sig.getName());
		        
	            result = pjp.proceed();
	            
	            long end = System.currentTimeMillis();
		        System.out.println("[AroundMethod after] : 메소드 호출 후");

		        System.out.println(" 호출 완료된 메소드:" + sig.getName());

	            System.out.println("수행 시간 : "+ (end - start)+"ms");
	        } catch (Throwable throwable) {
	            System.out.println("exception! ");
	        }
	        
	        return result;
	    }
	    
	    
}
