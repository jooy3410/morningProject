package poly.persistance.mapper;

import java.util.List;

import config.Mapper;
import poly.dto.RoutineDTO;

@Mapper("RoutineMapper")
public interface IRoutineMapper {

	//루틴 저장
	int insertRoutineInfo(RoutineDTO pDTO) throws Exception;
	
	//내 루틴 불러오기
	List<RoutineDTO> getMyRoutine(RoutineDTO pDTO) throws Exception;
	
	//루틴 상세
	RoutineDTO getRoutineDetail(RoutineDTO pDTO) throws Exception;
	
	//루틴 수정
	void updateRoutine(RoutineDTO pDTO) throws Exception;
	
	//루틴 삭제
	int deleteRoutine(RoutineDTO pDTO) throws Exception;
	
	
}
