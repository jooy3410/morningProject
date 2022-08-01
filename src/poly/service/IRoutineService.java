package poly.service;

import java.util.List;

import poly.dto.RoutineDTO;

public interface IRoutineService {

	
	//루틴 정보저장
	int insertRoutineInfo(RoutineDTO pDTO) throws Exception;
	
	//내 루틴 가져오기
	List<RoutineDTO> getMyRoutine(RoutineDTO pDTO) throws Exception;

	//루틴 상세
	RoutineDTO getRoutineDetail(RoutineDTO pDTO) throws Exception;
	
	//루틴 수정
	void updateRoutine(RoutineDTO pDTO) throws Exception;
	
	//루틴 삭제
	int deleteRoutine(RoutineDTO  pDTO) throws Exception;
}
