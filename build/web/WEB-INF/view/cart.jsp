<c:set var="view" value="/cart" scope="session"/>
<div id="singleColumn">
    <div id="actionBar">
        <%-- clear cart widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">

            <c:url var="url" value="viewCart">
                <c:param name="clear" value="true"/>
            </c:url>

            <a href="${url}" class="bubble hMargin">Clear Cart</a>
        </c:if>

       
        

       
        <a href="/ECommerce" class="bubble hMargin">Continue Shopping</a>

        <%-- checkout widget --%>
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <a href="<c:url value='checkout'/>" class="bubble hMargin">Proceed to checkout</a>
        </c:if>
    </div>

    <c:if test="${!empty cart && cart.numberOfItems != 0}">

      <div id="total"> Total:$ ${cart.total} </div>   
      <br>
      <table id="cartTable">

        <tr class="header">
            <th>Product</th>
            <th>Name</th>
            <th>Price</th>
            <th>Quantity</th>
        </tr>

        <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">

          <c:set var="product" value="${cartItem.product}"/>

          <tr class="${((iter.index % 2) == 0) ? 'lightBlue' : 'white'}">
            <td>
                <img src="${initParam.productImagePath}${product.name}.png">
            </td>

            <td>${product.name}</td>

            <td>
                $ ${cartItem.total}
                <br>
                <span class="smallText">(
                    ${product.price} / unit )</span>
            </td>

            <td>
                <form action="<c:url value='updateCart'/>" method="post">
                    <input type="hidden"
                           name="productId"
                           value="${product.id}">
                    <input type="text"
                           maxlength="2"
                           size="2"
                           value="${cartItem.quantity}"
                           name="quantity"
                           style="margin:5px">
                    <input type="submit"
                           name="submit"
                           value="update">
                </form>
            </td>
          </tr>

        </c:forEach>

      </table>

    </c:if>
</div>