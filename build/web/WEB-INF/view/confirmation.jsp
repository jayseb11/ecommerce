<%-- HTML markup starts below --%>

<div id="singleColumn">

    <p id="confirmationText">
        Your order has been successfully processed and will be delivered within 24 hours.
        <strong>${orderRecord.confirmationNumber}</strong>
        <br>
        If you have a query concerning your order, feel free to <a href="#">contact us</a>.
        <br><br>
        Thank you for shopping at the KeralaKitchen!
    </p>

    <div class="summaryColumn" >

        <table id="orderSummaryTable" class="detailsTable">
            <tr>
                <th colspan="3">Order Summary</th>
            </tr>

            <tr class="tableHeading">
                <td>Product</td>
                <td>Quantity</td>
                <td>Price</td>
            </tr>

            <c:forEach var="orderedProduct" items="${orderedProducts}" varStatus="iter">

                <tr class="${((iter.index % 2) != 0) ? 'lightBlue' : 'white'}">
                    <td>
                        "${products[iter.index].name}
                    </td>
                    <td class="quantityColumn">
                        ${orderedProduct.quantity}
                    </td>
                    <td class="confirmationPriceColumn">
                       $ ${products[iter.index].price * orderedProduct.quantity}
                    </td>
                </tr>

            </c:forEach>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="2" id="totalCellLeft"><strong>Total:</strong></td>
                <td id="totalCellRight">
                   $ ${orderRecord.amount}
                </td>
            </tr>

            <tr class="lightBlue"><td colspan="3" style="padding: 0 20px"><hr></td></tr>

            <tr class="lightBlue">
                <td colspan="3" id="dateProcessedRow"><strong>Date Processed:</strong>
                    ${orderRecord.dateCreated}
                </td>
            </tr>
        </table>

    </div>

    <div class="summaryColumn" >

        <table id="deliveryAddressTable" class="detailsTable">
            <tr>
                <th colspan="3">Delivery Address</th>
            </tr>

            <tr>
                <td colspan="3" class="lightBlue">
                    Name: ${customer.name}
                    <br>
                    Address: ${customer.address}
                    <br>
                    <strong>Email:${customer.email}
                    <br>
                    <strong>Phone:${customer.phone}
                </td>
            </tr>
        </table>
    </div>
</div>