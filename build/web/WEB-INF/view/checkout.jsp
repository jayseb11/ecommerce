<c:set var="view" value="/checkout" scope="session"/>


<script src="js/jquery.validate.js" type="text/javascript"></script>

<script type="text/javascript">

    $(document).ready(function(){
        $("#checkoutForm").validate({
            rules: {
                name: "required",
                email: {
                    required: true,
                    email: true
                },
                phone: {
                    required: true,
                    number: true,
                    minlength: 9
                },
                address: {
                    required: true
                },
                creditcard: {
                    required: true,
                    creditcard: true
                }
            }
        });
    });
</script>


<%-- HTML markup starts below --%>

<div id="singleColumn">

    <div id="checkout"> Checkout </div>

    <p>In order to purchase the items in your shopping cart, please provide us with the following information:</p>

    <c:if test="${!empty orderFailureFlag}">
        <p class="error">We were unable to process your order. Please try again!</p>
    </c:if>

    <form id="checkoutForm" action="<c:url value='purchase'/>" method="post">
        <table id="checkoutTable">
          <c:if test="${!empty validationErrorFlag}">
            <tr>
                <td colspan="2" style="text-align:left">
                    <span class="error smallText">Please provide valid entries for the following field(s):
                      <c:if test="${!empty nameError}">
                        <br><span class="indent"><strong>name</strong> (e.g., John Smith)</span>
                      </c:if>
                      <c:if test="${!empty emailError}">
                        <br><span class="indent"><strong>email</strong> (e.g., jsmith@gmail.com)</span>
                      </c:if>
                      <c:if test="${!empty phoneError}">
                        <br><span class="indent"><strong>phone</strong> (e.g., 222333444)</span>
                      </c:if>
                      <c:if test="${!empty addressError}">
                        <br><span class="indent"><strong>address</strong> (e.g., Korunní 56)</span>
                      </c:if>
                      <c:if test="${!empty ccNumberError}">
                        <br><span class="indent"><strong>credit card</strong> (e.g., 1111222233334444)</span>
                      </c:if>

                    </span>
                </td>
            </tr>
          </c:if>
            <tr>
                <td><label for="name">Name:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="name"
                           name="name"
                           value="${param.name}">
                </td>
            </tr>
            <tr>
                <td><label for="email">Email:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="email"
                           name="email"
                           value="${param.email}">
                </td>
            </tr>
            <tr>
                <td><label for="phone">Phone:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="16"
                           id="phone"
                           name="phone"
                           value="${param.phone}">
                </td>
            </tr>
            <tr>
                <td><label for="address">Address:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="45"
                           id="address"
                           name="address"
                           value="${param.address}">

                   
                </td>
            </tr>
            <tr>
                <td><label for="creditcard">Credit Card Number:</label></td>
                <td class="inputField">
                    <input type="text"
                           size="31"
                           maxlength="19"
                           id="creditcard"
                           name="creditcard"
                           class="creditcard"
                           value="${param.creditcard}">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Submit">
                </td>
            </tr>
        </table>
    </form>
               
    <div id="infoBox">

        <table id="priceBox">
            <tr>
                <td class="total">Total:</td>
                <td class="total checkoutPriceColumn">
                   $ ${cart.total}"</td>
            </tr>
        </table>
    </div>
</div>