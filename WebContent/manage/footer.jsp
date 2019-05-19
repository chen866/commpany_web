<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="footer">
        <div class="pull-right">
            <!--  -->
        </div>
        <div>
            ${footer}
        </div>
    </div>

</div>
</div>



	<!-- Mainly scripts -->
<script src="${pageContext.request.contextPath}/manage/js/jquery-2.1.1.js"></script>
<script src="${pageContext.request.contextPath}/manage/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/manage/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/manage/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

<!-- Custom and plugin javascript -->
<script src="${pageContext.request.contextPath}/manage/js/inspinia.js"></script>
<script src="${pageContext.request.contextPath}/manage/js/plugins/pace/pace.min.js"></script>

<!-- SUMMERNOTE -->
<script src="${pageContext.request.contextPath}/manage/js/plugins/summernote/summernote.min.js"></script>

<script>
    $(document).ready(function(){
        let sum=$('.summernote');
        if(sum!=null && sum!=undefined){
            sum.summernote();
        }
    });
    var edit = function() {
        let sum2=$('.click2edit');
        if(sum2!=null && sum2!=undefined){
            sum2.summernote({focus: true});
        }
    };
    var save = function() {
        let click2edit=$('.click2edit');
        if(click2edit!=null && click2edit!=undefined){
            var aHTML = click2edit.code(); //save HTML If you need(aHTML: array).
            click2edit.destroy();
        }
    };
</script>
</body>
</html>