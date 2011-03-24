<!--STATUS OK-->
<html>
    
    <head>
        <meta http-equiv=content-type content="text/html; charset=utf-8">
        <title>
            {{$user_name}}的空间_编辑分类
        </title>
        
        <link rel="stylesheet" type="text/css" href="../css/comm.css">
        
    </head>
    
    <body>
            <div class="dialog">
            <div class="box" style="padding:0">
                <div style="padding:10px">
                    <table border="0" cellspacing="0" cellpadding="0" class="formarea">
                        <tr>
                            <td>
                                <span class="f14">
             				                       添加新的文章分类：
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" id="addcatid" onChange="checkaddinput('addcatid')"
                                onfocus="hiddenError(1)" style="width:210px" value="">
                                <div id="1_err_msg" class="error" style="display:none">
                                </div>
                            </td>
                        </tr>
                        <tr>
                        	
                            <td>
                                <input type="button" onclick="../article/" value=" 添加 ">
                            </td>
                        </tr>
                    </table>
                    <div class="line">
                        &nbsp;
                    </div>
                    <div class="itn">
              		          管理已有分类
                    </div>
                    <div id="2_err_msg" class="error" style="display:none">
                    </div>
                </div>
            </div>
             <table width='100%' border='0' cellspacing='0' cellpadding='0' class='list'>
         		<tr style='font-weight:bold'>
         			<td width='68%' class='hd padl'>分类名称</td>
         			<td width='14%' align='center' class='hd'>重命名</td>
         			<td width='18%' align='center' class='hd'>删除</td>
				
         		</tr>
         			{{section name=id loop=$category_number}}
         		<tr style='font-weight:bold'>
         			<td width='68%' align="left">&nbsp;&nbsp;{{$categorylist[id][1]}}</td>
         			<td align='center'>
         				<a href=""  title="重命名"><img src="../images/edit.gif" border=0 ></img></a>
         			</td>
         			<td align='center'> 
         				<a href=""  title="删除"><img src="../images/del.gif" border=0 ></img></a>
         			</td>
         		</tr>
         			{{/section}}
        	 </table>
        </div>
      

    </body>

</html>