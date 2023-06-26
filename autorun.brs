function main()

	` Create Message Port
	mp = CreateObject("roMessagePort") 

	` Create Rectangle for HTML Widget
	r = CreateObject("roRectangle",0,0,1920,1080)
	
	` Create config for HTML Widget
	config = {
		nodejs_enabled: true
		inspector_server: {
			port: 3000
		}
		url: "file:///sd:/index.html"
		port: mp
	}

	h = CreateObject("roHtmlWidget",r,config)
	h.Show()


	` Event Loop

	while true
		msg = wait(0,mp)
		print "msg received - type=";type(msg)

		if type(msg) = "roHtmlWidgetEvent" then
			print "msg: ";msg
		end if
	end while

end function