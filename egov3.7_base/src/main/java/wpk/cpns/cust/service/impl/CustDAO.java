package wpk.cpns.cust.service.impl;

import java.util.List;

import egovframework.com.cmm.service.impl.EgovComAbstractDAO;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import wpk.com.service.ComDefaultVO;
import wpk.cpns.cpn.service.CouponVO;
import wpk.cpns.cust.service.CustCouponVO;
import wpk.cpns.cust.service.CustVO;

import org.springframework.stereotype.Repository;

/**
 * 일반회원관리에 관한 데이터 접근 클래스를 정의한다.
 * @author 공통서비스 개발팀 조재영
 * @since 2009.04.10
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.10  조재영          최초 생성
 *   2017.07.21  장동한 			로그인인증제한 작업
 *
 * </pre>
 */
@Repository("custDAO")
public class CustDAO extends EgovComAbstractDAO{
	
	/**
	 * 입주사 리스트 취득
	 * @param custSearchVO 검색조건
	 * @return List<CustVO> 입주사 리스트
	 */
	public List<CustVO> selectCustList(ComDefaultVO custSearchVO){
		return selectList("custDAO.selectCustList", custSearchVO);
	}
	
	/**
	 * 전체 입주사 수 취득
	 * @param custSearchVO 검색조건
	 * @return int 전체 입주사 수
	 */
	public int selectCustListTotalCnt(ComDefaultVO custSearchVO) {
		return (Integer)selectOne("custDAO.selectCustListTotalCnt", custSearchVO);
	}
	
	/**
	 * 입주사 정보 취득
	 * @param custSeq 검색조건
	 * @return CustVO 입주사 정보
	 */
	public CustVO selectCust(String custSeq){
		return selectOne("custDAO.selectCust", custSeq);
	}
	
	/**
	 * 입주사 정보 변경
	 * @param custVO 입주사 수정 정보
	 * @return int 변경 입주사 수
	 */
	public int updateCust(CustVO custVO){
		return update("custDAO.updateCust", custVO);
	}
	
	/**
	 * 입주사 암호 초기화
	 * @param custVO 입주사 정보
	 * @return int 암호 초기화 입주사 수
	 */
	public int updatePassword(CustVO custVO) {
		return update("custDAO.updatePassword", custVO);
	}
	
	/**
	 * 입주사 아이디 중복체크
	 * @param custVO 중복체크 대상 입주사 정보
	 * @return int 중복 아이디 수
	 */
	public int checkIdDuplicate(CustVO custVO) {
		return (Integer)selectOne("custDAO.checkIdDuplicate", custVO);
	}
	
	/**
	 * 입주사 정보 등록
	 * @param custVO 입주사 정보
	 * @return int 등록 입주사 수
	 */
	public int insertCust(CustVO custVO){
		return insert("custDAO.insertCust", custVO);
	}
	
	/**
	 * 화면에 조회된 일반회원의 정보를 데이터베이스에서 삭제
	 * @param delId 삭제 대상 일반회원아이디
	 */
//	public void deleteMber(String delId){
//		delete("mberManageDAO.deleteMber_S", delId);
//	}
	
	/**
	 * 일반회원의 기본정보를 화면에서 입력하여 항목의 정합성을 체크하고 데이터베이스에 저장
	 * @param mberManageVO 일반회원 등록정보
	 * @return String 등록결과
	 */
//	public String insertMber(MberManageVO mberManageVO){
//		return String.valueOf((int)insert("mberManageDAO.insertMber_S", mberManageVO));
//	}
	
	/**
	 * 기 등록된 사용자 중 검색조건에 맞는일반회원의 정보를 데이터베이스에서 읽어와 화면에 출력
	 * @param mberId 상세조회대상 일반회원아이디
	 * @return MberManageVO 일반회원 상세정보
	 */
//	public MberManageVO selectMber(String mberId){
//		return (MberManageVO) selectOne("mberManageDAO.selectMber_S", mberId);
//	}
	
	/**
	 * 화면에 조회된일반회원의 기본정보를 수정하여 항목의 정합성을 체크하고 수정된 데이터를 데이터베이스에 반영
	 * @param mberManageVO 일반회원수정정보
	 */
//	public void updateMber(MberManageVO mberManageVO){
//		update("mberManageDAO.updateMber_S",mberManageVO);
//	}
	
	/**
	 * 일반회원 약관확인
	 * @param stplatId 일반회원약관아이디
	 * @return List 일반회원약관정보
	 */
//	public List<?> selectStplat(String stplatId){
//		return selectList("mberManageDAO.selectStplat_S", stplatId);
//	}
	
	/**
	 * 일반회원 암호수정
	 * @param passVO 기업회원수정정보(비밀번호)
	 */
//	public void updatePassword(MberManageVO passVO) {
//		update("mberManageDAO.updatePassword_S", passVO);
//	}
	
	/**
	 * 일반회원이 비밀번호를 기억하지 못할 때 비밀번호를 찾을 수 있도록 함
	 * @param mberManageVO 일반회원암호 조회조건정보
	 * @return MberManageVO 일반회원 암호정보
	 */
//	public MberManageVO selectPassword(MberManageVO mberManageVO){
//		return (MberManageVO) selectOne("mberManageDAO.selectPassword_S", mberManageVO);
//	}
	
	/**
	 * 로그인인증제한 해제
	 * @param mberManageVO 일반회원정보
	 */
//	public void updateLockIncorrect(MberManageVO mberManageVO) {
//		update("mberManageDAO.updateLockIncorrect", mberManageVO);
//	}

}