package poly.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import poly.dto.RoutineDTO;
import poly.persistance.mapper.IRoutineMapper;
import poly.service.IRoutineService;

@Service("RoutineService")
public class RoutineService implements IRoutineService{
	
	@Resource(name="RoutineMapper")
	private IRoutineMapper routineMapper;
	
	private Logger log = Logger.getLogger(this.getClass());

	@Override
	public int insertRoutineInfo(RoutineDTO pDTO) throws Exception{
		

		log.info(this.getClass().getName() + " insertRoutineInfo 시작");
		
		return routineMapper.insertRoutineInfo(pDTO);
	}

	
	//내 루틴 가져오기
	@Override
	public List<RoutineDTO> getMyRoutine(RoutineDTO pDTO) throws Exception {
		
		return routineMapper.getMyRoutine(pDTO);
	}

	//루틴 상세
	@Override
	public RoutineDTO getRoutineDetail(RoutineDTO pDTO) throws Exception {
		
		return routineMapper.getRoutineDetail(pDTO);
	}

	//루틴 수정
	@Override
	public void updateRoutine(RoutineDTO pDTO) throws Exception {
		
		routineMapper.updateRoutine(pDTO);
	}

	//루틴 삭제
	@Override
	public int deleteRoutine(RoutineDTO pDTO) throws Exception {
		
		return routineMapper.deleteRoutine(pDTO);
	}
	
	
	
	

}
