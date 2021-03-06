<%-- 
    Document   : listar
    Created on : Feb 2, 2020, 9:33:37 PM
    Author     : Daniel Molina
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Lista de editoriales</title>
        <jsp:include page="/WEB-INF/jsp/cabecera.jsp"/>
    </head>
    <body>
        <jsp:include page="/WEB-INF/jsp/menu.jsp"/>
        <div class="container">
            <div class="row">
                <h3>Lista de editoriales</h3>
            </div>
            <div class="row">
                <div class="col-md-10">
                    <a class="btn btn-primary btn-md" href="<s:url value="/editoriales/create"/>"> Nuevo editorial</a>
                <br><br>
                <table class="table table-striped table-bordered table-hover" id="tabla">
                    <thead>
                        <tr>
                            <th>Codigo del editorial</th>
                            <th>Nombre del editorial</th>
                            <th>Contacto</th>
                            <th>Telefono</th>
                            <th>Operaciones</th>
                        </tr>
                    </thead>
                    <tbody>
                   
                        <c:forEach items="${listaEditoriales}" var="editorial">
                            <tr>
                                <td>${editorial.codigoEditorial}</td>
                                <td>${editorial.nombreEditorial}</td>
                                <td>${editorial.contacto}</td>
                                <td>${editorial.telefono}</td>
                                <td>       
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                </div>
                
            </div>                    
        </div> 
                    <jsp:include page="/WEB-INF/jsp/pie.jsp"/>
 <script>
     $(document).ready(function(){
        $('#tabla').dataTable( {
             "language": {
            "url": "cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
            }
         });
         
     });
     </script>
    </body>
</html>

