const bodyParser = require("body-parser")
const express = require('express');
const app = express();
const path = require('path');
const md5 = require('md5');
const ejs = require("ejs")
const mysql = require('mysql')
const multer = require("multer");
const { connect } = require("http2");

require('dotenv').config()

app.use(bodyParser.json());
 app.use(bodyParser.urlencoded({ extended: true }));
//Used to access static files from public folder
app.use(express.static("public"));

//Configure View Engine
app.set('view engine', 'ejs');

//Establishing Connection to database
var connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_SCHEMA,
    dateStrings: 'date'
});

connection.connect(function (error) {
    if (error) {
        console.log("Error in Connecting Database");
        throw error;
    } else {
        console.log("Connected to Database");
    }
});

app.get("/",function(req,res){
 res.send("Hi");
});

/************************************Seller Starts*************************************************/

//Seller Landing Page
app.get("/business", function (req, res) {
    res.render('index');
});

//Seller Register Page-1
app.get("/business/register",function(req, res){
    res.render('sellerRegister1',{flag :false});
})

app.post("/business/register/home",function(req,res){
  var b_name=req.body.b_name;
  var b_owner=req.body.b_owner;
  var b_mobile=parseInt(req.body.b_mobile);
 res.render("sellerRegister1",{flag :true ,b_name,b_owner,b_mobile});
})

app.post("/business/register/nextstep",function(req,res){
    var data = req.body;
    var sPassword = md5(data.sPassword);
    var query = "INSERT INTO seller_details (sName, sPhoneNo, sDOB, sGender, sAddress, sCity, sState, sZip, sAadhar, sPAN, sPassword) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    var list = [data.sName, data.sPhoneNo, data.sDOB, data.sGender, data.sAddress, data.sCity, data.sState, data.sZip, data.sAadhar, data.sPAN, data.sPassword]
    connection.query(query, list, function(err, rows){
        if(err){
            console.log(err);
        }
        else{
            console.log("Successfully inserted seller data.");
            var seller;
            connection.query("SELECT sId from seller_details where sPhoneNo = ?",data.sPhoneNo, function(err, row){
                if(err){
                    console.log(err);
                }
                else{
                    seller = row[0].sId;
                    var query2 = "INSERT INTO business_details (seller, bName, bCategory, bMobile, bGST,bEmail, bWebsite, bAddress, bCity, bState, bZip) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    var list = [seller, data.bName, data.bCategory, data.bMobile, data.bGST,data.bEmail, data.bWebsite, data.bAddress, data.bCity, data.bState, data.bZip];
                    connection.query(query2, list,function(err){
                        if(err){
                            console.log(err);
                        }
                        else{
                            console.log("Successfully inserted business data.");
                            res.redirect("/business");
                        }
                    });
                    
                }
            });
            
        }
    });
  });




/************************************Seller Ends*************************************************/

app.listen(process.env.PORT || 3000, function () {
    console.log("Connected at 3000");
})
