package kr.co.gudi.reserve.dao;

import java.util.ArrayList;

import kr.co.gudi.reserve.dto.ReserveDTO;

public interface ReserveListDAO {

	ArrayList<ReserveDTO> reserveList();

	int checkId(String loginId);

}
