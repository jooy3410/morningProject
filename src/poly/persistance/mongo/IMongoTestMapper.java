package poly.persistance.mongo;

public interface IMongoTestMapper {
	/**
	 * MongoDB 켤렉션 생성하기
	 * 
	 * @param cloNm 생성하는 컬렉션 이름
	 */
	public boolean createCollection(String colNm) throws Exception;

}
