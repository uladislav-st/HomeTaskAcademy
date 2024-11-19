func formatSaleSummary(products: [Product], totalRevenue: Int) -> String {
    var summary = "Остаток к концу смены:\n"
    for product in products {
        summary += "\(product.name): Осталось \(product.quantity) шт\n"
    }
    summary += "\nИтоговая выручка за смену: \(totalRevenue)р"
    return summary
}

func calculateSales(products: inout [Product], selectedQuantities: inout [Int], totalRevenue: inout Int) -> String {
    var totalSaleAmount = 0
    var saleDetails = ""

    for i in 0..<products.count {
        let quantityToSell = selectedQuantities[i]
        if quantityToSell > 0 {
            let saleAmount = quantityToSell * products[i].price
            totalRevenue += saleAmount
            totalSaleAmount += saleAmount
            products[i].quantity -= quantityToSell

            saleDetails += "\(products[i].name): Продано \(quantityToSell) шт на сумму \(saleAmount)р\n"
            selectedQuantities[i] = 0
        }
    }

    return saleDetails.isEmpty ? Constants.Texts.noSelectionMessage : saleDetails
}
