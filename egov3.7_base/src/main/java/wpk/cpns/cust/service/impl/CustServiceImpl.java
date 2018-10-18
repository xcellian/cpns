package wpk.cpns.cust.service.impl;

import java.util.List;

import egovframework.com.uss.umt.service.EgovMberManageService;
import egovframework.com.uss.umt.service.MberManageVO;
import egovframework.com.uss.umt.service.UserDefaultVO;
import egovframework.com.utl.sim.service.EgovFileScrty;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import wpk.cpns.cust.service.CustVO;
import wpk.com.service.ComDefaultVO;
import wpk.com.service.ParkMasterVO;
import wpk.com.service.WpkComUtilService;
import wpk.cpns.cpn.service.CouponVO;
import wpk.cpns.cust.service.CustCouponVO;
import wpk.cpns.cust.service.CustService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * 일반회원관리에 관한비지니스클래스를 정의한다.
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
 *   2014.12.08	 이기하			암호화방식 변경(EgovFileScrty.encryptPassword)
 *   2017.07.21  장동한 			로그인인증제한 작업
 *
 * </pre>
 */
@Service("custService")
public class CustServiceImpl extends EgovAbstractServiceImpl implements CustService {
	
	/** custDAO */
	@Resource(name="custDAO")
	private CustDAO custDAO;
	
	/** custSeqGnrService */
	@Resource(name="custSeqGnrService")
	private EgovIdGnrService idgenService;
	
	/** WpkComUtilService */
	@Resource(name = "wpkComUtilService")
	private WpkComUtilService wpkComUtilService;
	
	/** EgovPropertyService */
	@Resource(name = "wpkPropertiesService")
	protected EgovPropertyService propertiesService;
	
	/**
	 * 입주사 리스트 취득
	 * @param custSearchVO 검색조건
	 * @return List<CustVO> 입주사 리스트
	 */
	@Override
	public List<CustVO> selectCustList(ComDefaultVO custSearchVO) {
		return custDAO.selectCustList(custSearchVO);
	}
	
	/**
	 * 전체 입주사 수 취득
	 * @param custSearchVO 검색조건
	 * @return int 전체 입주사 수
	 */
	@Override
	public int selectCustListTotalCnt(ComDefaultVO custSearchVO) {
		return custDAO.selectCustListTotalCnt(custSearchVO);
	}
	
	/**
	 * 입주사 정보 취득
	 * @param custSeq 검색조건
	 * @return CustVO 입주사 정보
	 */
	@Override
	public CustVO selectCust(String custSeq) {
		return custDAO.selectCust(custSeq);
	}
	
	/**
	 * 입주사 정보 변경
	 * @param custVO 입주사 수정 정보
	 * @return int 변경 입주사 수
	 * @throws Exception
	 */
	@Override
	public int updateCust(CustVO custVO) throws Exception {
		return custDAO.updateCust(custVO);
	}
	
	/**
	 * 입주사 암호 초기화
	 * @param custVO 입주사 정보
	 * @return int 암호 초기화 입주사 수
	 * @throws Exception
	 */
	@Override
	public int updatePassword(CustVO custVO) throws Exception {
		//비밀번호 암호화
		String encryptPass = EgovFileScrty.encryptPassword("0000", custVO.getCustId());
		custVO.setCustPwd(encryptPass);
		return custDAO.updatePassword(custVO);
	}
	
	/**
	 * 입주사 아이디 중복체크
	 * @param custVO 중복체크 대상 입주사 정보
	 * @return int 중복 아이디 수
	 */
	@Override
	public int checkIdDuplicate(CustVO custVO) {
		return custDAO.checkIdDuplicate(custVO);
	}
	
	/**
	 * 입주사 정보 등록
	 * @param custVO 입주사 정보
	 * @return int 등록 입주사 수
	 * @throws Exception
	 */
	@Override
	public int insertCust(CustVO custVO) throws Exception {
		
		//주차장 검색
		ParkMasterVO parkVO = new ParkMasterVO();
		parkVO.setParkCd(custVO.getParkCd());
		parkVO = wpkComUtilService.selectPark(parkVO);
		
		//custSeq 설정
		String custSeq = idgenService.getNextStringId();
		custVO.setCustSeq(propertiesService.getString("prefixCustSeq") + parkVO.getAcsType() + custSeq);
		//패스워드 설정
		String encryptPass = EgovFileScrty.encryptPassword("0000", custVO.getCustId());
		custVO.setCustPwd(encryptPass);
		
		return custDAO.insertCust(custVO);
	}
	
}