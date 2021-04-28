package com.spring.aop.aspect;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;

import com.spring.main.dao.MemberDAO;

@Aspect
public class LogAspect {
	
	@Autowired MemberDAO memberdao;

	//service의 메서드에서 보내온 반환값을 가로채서 먼저 확인한다
	@AfterReturning(pointcut="execution(* com.spring.main.service.GroupService.groupWrite(..))  ", returning="result")
	public void logAfterReturning(JoinPoint jp, Object result) {
		System.out.println("*****************************");
		System.out.println("logAfterReturning() 실행");
		System.out.println("기준 메서드: "+jp.getSignature().getName());
		
		String loginId= "yezi"; //세션아이디 넣을 예정
		int cntResult = memberdao.gradeCntBoard(loginId); //회원등급 글쓰기  카운트
		System.out.println("result:"+cntResult);

		System.out.println("가로챈 반환값: "+result);
		System.out.println("*****************************");
	}
	
	
	
	
	
	
	
}
