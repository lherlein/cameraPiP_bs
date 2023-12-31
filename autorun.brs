function main()


	mp = CreateObject("roMessagePort") 

	enableLDWS()
	enableSSH()

	widget = createHTMLWidget(mp)
	widget.Show()


	while true
		msg = wait(0,mp)
		print "msg received - type=";type(msg)

		if type(msg) = "roHtmlWidgetEvent" then
			print "msg: ";msg
		end if
	end while

end function

function createHTMLWidget(mp as object) as object
	
	reg = CreateObject("roRegistrySection","html")
	reg.Write("enable_web_inspector","1")
	reg.Flush()

	r = CreateObject("roRectangle",0,0,1920,1080)
	
	config = {
		nodejs_enabled: true
		inspector_server: {
			port: 3000
		}
		url: "file:///sd:/index.html"
		port: mp
	}

	h = CreateObject("roHtmlWidget",r,config)
	return h

end function

function enableLDWS()
	
	registrySection = CreateObject("roRegistrySection", "networking")
	
	if type(registrySection) = "roRegistrySection" then 

		registrySection.Write("http_server", "80")
	
	endif

	registrySection.Flush()

end function

function enableSSH()

	regSSH = CreateObject("roRegistrySection", "networking")
	regSSH.write("ssh","22")

	n = CreateObject("roNetworkConfiguration", 0)
	n.SetLoginPassword("password")
	n.Apply()

	regSSH.Flush()

end function