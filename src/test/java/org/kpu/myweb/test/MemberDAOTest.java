package org.kpu.myweb.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kpu.myweb.domain.CustomerVO;
import org.kpu.myweb.persistence.MemberDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
public class MemberDAOTest {

	@Autowired
	private MemberDAO dao;
	private static Logger logger = LoggerFactory.getLogger(MemberDAOTest.class);
	private static String name = "junitTest";
	
	
	@Test
	public void testCustomerSignUp() throws Exception {
		CustomerVO vo = new CustomerVO();
		List<CustomerVO> voList;
		vo.setName(name);
		vo.setId(name);
		vo.setPasswd(name);
		vo.setPhoneNumber(name);
		vo.setPassportNumber(name);
		
		
		dao.signUp(vo);
		logger.info("signUp 성공");
		
		CustomerVO useVo;
		useVo = dao.getUserInfoById(name);
		useVo.setName("정보수정Test");
		dao.updateUserInfo(useVo);
		
		vo = dao.getUserInfoById(name);
		logger.info(vo.toString());
		
		dao.deleteUserInfo(vo.getId());
	}
	
	@Test
	public void testCustomerSignIn() throws Exception {
		CustomerVO vo;
		if(dao.signin("test1234", "test!1234")){
			logger.info("signIn-1 success");
		}else {
			logger.info("signIn-1 fail");			
		}
		
		if(!dao.signin("test1234", "errorPasswd")) {
			logger.info("signIn-2 success");
		}else {
			logger.info("signIn-2 fail");			
		}
	}
	
	
	
	
}
