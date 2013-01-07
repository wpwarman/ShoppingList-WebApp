class UrlMappings {

	static mappings = {
		// "/productListREST/$id" (controller:"product") {
		//	action = [GET: "listREST"]
		//}
		
		//"/productSaveREST/$id" (controller:"product") {
		//	action = [GET: "saveREST"]
		//}
		
		//"/productDeleteREST/$id" (controller:"product") {
		//	action = [GET: "deleteREST"]
		//}
		
		//"/productUpdateREST/" (controller:"product") {
		//	action = [GET: "updateREST"]
		//}
		
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
			
		"/"(view:"/index")
		"500"(view:'/error')
	}
}
