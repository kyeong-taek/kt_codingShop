package com.lkt0520.exchange;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/indexMain/*")
public class IndexController {

	@GetMapping("/main")
	public String exchangeRate() {
		return "/exchangeRate";
	}
	
	
}