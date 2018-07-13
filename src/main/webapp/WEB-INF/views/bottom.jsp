<!-- Bootstrap core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
 	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.js"></script>

    <!-- Contact form JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/jqBootstrapValidation.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/resources/js/contact_me.js"></script> --%>

    <!-- Custom scripts for this template -->
    <script src="${pageContext.request.contextPath}/resources/js/agency.min.js"></script>
    
    <script>
	    $(document).ready(function() {
	        $('#boardcontent').summernote({
	        	height:300	
	        });
	    });
	    function save(){
	    	$('textarea[name="boardcontent"]').html($('.summernote').code());
	    }
	</script>
  </body>

</html>