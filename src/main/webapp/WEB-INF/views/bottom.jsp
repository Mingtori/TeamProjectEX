	<!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Contact form JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/jqBootstrapValidation.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/contact_me.js"></script>

    <!-- Custom scripts for this template -->
    <script src="${pageContext.request.contextPath}/resources/js/agency.min.js"></script>
    <script type="text/javascript" src="//api.poesis.kr/post/search.js?v=3.4.1-0" charset="UTF-8"></script>
	<link rel="stylesheet" type="text/css" href="//api.poesis.kr/post/search.css?v=3.4.1-0" media="all">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>
    <script src="https://smtpjs.com/v2/smtp.js"></script>


    <script>
	    $(document).ready(function() {
	        $('#boardcontent').summernote({
	        	toolbar: [
	        	          // [groupName, [list of button]]
	        	          ['style', ['bold', 'italic', 'underline', 'clear']],
	        	          ['font', ['strikethrough', 'superscript', 'subscript']],
	        	          ['fontsize', ['fontsize']],
	        	          ['color', ['color']],
	        	          ['para', ['ul', 'ol', 'paragraph']],
	        	          ['height', ['height']]
	        	        ],
	        	height:300	
	        });
	    });
	    function save(){
	    	$('textarea[name="boardcontent"]').html($('.summernote').code());
	    }
	    $(function() { $("#memaddr_button").postcodifyPopUp({ 
    		insertPostcode5 : "#mempost",
            insertAddress : "#memaddr",
            insertDetails : "#memaddrdetail" 
    	});
    });
	    $(function() { $("#comaddr_button").postcodifyPopUp({ 
	    		insertPostcode5 : "#compost",
	            insertAddress : "#comaddr",
	            insertDetails : "#comaddrdetail" 
	    	});
	    });
	</script>
	
  </body>
</html>