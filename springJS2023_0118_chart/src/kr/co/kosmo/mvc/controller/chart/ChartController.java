package kr.co.kosmo.mvc.controller.chart;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/mychart")
public class ChartController {
	
	
	@GetMapping("/chartlist")
	public ModelAndView chartlist() {
		ModelAndView mav = new ModelAndView("chart/chartList");
		return mav;
	}

	@GetMapping("/deptJson")
	public ModelAndView deptJson() {
		ModelAndView mav = new ModelAndView("chart/deptJsonDemo");
		return mav;
	}
	
	@GetMapping("/memberListJsonDemo")
	public ModelAndView memberListJsonDemo() {
		ModelAndView mav = new ModelAndView("chart/memberListJsonDemo");
		return mav;
	}
	
	

	@GetMapping("/donutchart")
	public ModelAndView donutchart() {
		ModelAndView mav = new ModelAndView("chart/donutChart");
		return mav;
	}
	
	@GetMapping("/deptJsonDemo")
	public String deptJsonDemo() {
		return "chart/deptJsonDemo";
	}
	
	@GetMapping("/surveyAjax")
	public String surveyAjax() {
		return "chart/surveyDonutChartAjax";
	}
	


}
