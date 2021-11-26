package com.kh.almin.recruit.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.almin.comments.model.service.CommentsService;
import com.kh.almin.recruit.controller.RecruitController;
import com.kh.almin.recruit.model.vo.Recruit;
import com.kh.almin.recruit.model.vo.SearchRecruit;
import com.kh.almin.recruit.model.service.RecruitService;

@Controller
@RequestMapping("/recruits")
public class RecruitController {
	@Autowired
	private RecruitService recruitService;
	@Autowired
	private CommentsService commentsService;

	private static final Logger logger = LoggerFactory.getLogger(RecruitController.class);

	@GetMapping
	private ModelAndView viewRecruits(SearchRecruit searchRecruit, ModelAndView mv) throws Exception {
		List<Recruit> volist = null;
		List<Recruit> svolist = null;
		String msg = "";
		if (!ObjectUtils.isEmpty(searchRecruit) && searchRecruit.getRecruitJobDistrict() != 0) {
			svolist = recruitService.searchRecruit(searchRecruit);
			if (svolist == null || svolist.size() == 0) {
				msg = "검색 결과가 없습니다.";
				volist = recruitService.recruitList();
				mv.addObject("recruits", volist);
			}
			mv.addObject("msg", msg);
			mv.addObject("recruits", svolist);
		} else {
			volist = recruitService.recruitList();
			mv.addObject("recruits", volist);
		}
		mv.setViewName("recruits/jobinfoList");
		logger.info("공고 조회");
		return mv;
	}

	@RequestMapping(value = "/report", method = RequestMethod.GET)
	private ModelAndView reportRecruit(@RequestParam("recruitNo") int recruitNo, ModelAndView mv, RedirectAttributes ra) throws Exception {
		String msg = "";
		msg = "공고가 신고되었습니다.";
		int result = recruitService.reportRecruit(recruitNo);
		ra.addFlashAttribute("msg", msg);
		ra.addAttribute("recruitNo", recruitNo);
		mv.setViewName("redirect:/recruits/detailjobinfo");
		return mv;
	}

	@GetMapping(value = "/detailjobinfo")
	public ModelAndView detailjobinfo(@RequestParam("recruitNo") int recruitNo, ModelAndView mv
			, @RequestParam(name="msg", required = false) String msg
			) throws Exception {
		Map<String, List<String>> commentsMap = null;
		try {
			commentsMap = commentsService.selectAllKeyWords();
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("commentsMap", commentsMap);
		mv.addObject("detailjobinfo", recruitService.detailjobinfo(recruitNo));
		mv.setViewName("recruits/detailjobinfo");
		return mv;
	}

	@ExceptionHandler
	private ModelAndView handleMemberException(Exception e) {
		logger.error(e.getMessage());
		// 나중에 500error.jsp에서 "errorMessage" 표시해주기 + 뒤로가기, 홈으로 이동 버튼
		ModelAndView mv = new ModelAndView();
		mv.addObject("errorMessage", e.getMessage());
		mv.setViewName("error/500error");
		return mv;
	}

}
