<div id="RightColumn">

      <table id="productTable" class="aligncenter">

        <c:forEach var="product" items="${Products}" varStatus="iter">

            <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
                <td>
                    <img src="${initParam.productImagePath}${product.name}.png">
                </td>

                <td>
                    ${product.name}
                    <br>                   
                </td>

                <td>$ ${product.price}</td>

                <td>
                    <form action="<c:url value='addToCart'/>" method="post">
                        <input type="hidden"
                               name="productId"
                               value="${product.id}">
                        <input type="submit"
                               name="submit"
                               value="add to cart">
                    </form>
                </td>
            </tr>

        </c:forEach>

    </table>
</div>