// JavaScript source code
var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection(
    {
        host: "localhost",
        port: 3306,

        user: "root",
        password: "",

        database: "bamazon"
    });

connection.connect(function (err) {
    if (err) throw err;
    tableStuff();
});

var tableStuff = function () {
    connection.query("SELECT * FROM bamazon_products", function (err, res) {
        for (var i = 0; i < res.length; i++) {
            console.log(res[i].item_id + " || " + res[i].product_name + " || "
                + res[i].department_name + " || " + res[i].product_cost + " || "
                + res[i].stock_quantity);
        }
        questPrompt(res);
    });
}

var questPrompt = function (res) {
    inquirer.prompt([{
        type: "input",
        name: "purchase",
        message: "What product would you like to purchase?"
    }]).then(function (answer) {
        var correct = false;
        for (var i = 0; i < res.length; i++) {
            if (res[i].product_name === answer.purchase) {
                correct === true;
                var product = answer.purchase;
                var id = i;

                inquirer.prompt({
                    type: "input",
                    name: "quantity",
                    message: "How many would you like?",
                    validate: function (value) {
                        if (isNaN(value) === false) {
                            return true;
                        } else {
                            return false;
                        }
                    }
                }).then(function (answer) {
                    if ((res[id].stock_quantity - answer.quantity) > 0) {
                        connection.query("UPDATE products SET stock_quantity = '" + (res[id].stock_quantity - answer.quantity) +
                            "WHERE product_name =" + product + "",
                            function (err, res2) {
                                console.log("Product Purchased!");
                                tableStuff();
                            })
                    } else {
                        console.log("Selection invalid!");
                        questPrompt(res);
                    }
                });
            }
        }
    });
}