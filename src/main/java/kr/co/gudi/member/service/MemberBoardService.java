package kr.co.gudi.member.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.gudi.member.dao.MemberBoardDAO;
import kr.co.gudi.member.dto.MemberBoardDTO;

@Service
public class MemberBoardService {
	@Autowired MemberBoardDAO dao;
	
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
		public Map<String, Object> memyBoardList(String page, String loginId, String date) {
		
		// pagePerNum 과 page 를 가지고 offset 을 계산해 내자

				int offset = 0;
				int p =Integer.parseInt(page);
				offset = 5*(p-1);
				ArrayList<MemberBoardDTO> list = new ArrayList<MemberBoardDTO>();
				logger.info("date : "+date);
				if(date.equals("0")) {
				list = dao.memyBoardList(loginId,offset);
				}else {
				list = dao.mebdatefilter(loginId,date,offset);
				}
				//만들수 있는 총 페이지수
				logger.info("filter : "+loginId);
				int max = dao.mebmaxpage(loginId);
				logger.info("만들 수 있는 총 페이지수 : "+max);
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				// 만약 현재 보고있는 페이지가, 총 페이지수 보다 크면 현재페이지를 총 페이지수로 변경한다.
				if(p>max) {
					
					p = max;
				}
				
				map.put("currPage", p);
				
				map.put("pages", max/5);
				logger.info("list : "+list);
				map.put("list", list);
				

				
				
				return map;
				}//분기


		
		public int relist(ArrayList<String> adbDelList) {
			// TODO Auto-generated method stub
			
			int cnt = 0;
			
			for(String b_num : adbDelList) {
				
				cnt += dao.mebDelList(Integer.parseInt(b_num));
				
			}
			
			
			return cnt;
		}

}
