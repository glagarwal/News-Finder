/**
 * @description This is the external javascript code called in the News Finder - index.html
 * @author Gaurav Agarwal
 * @date Feb 3, 2019
 */
$(document).ready(function () {
    setFromDate();
});

function setFromDate() {
    var now = new Date();
    var day = ("0" + now.getDate()).slice(-2);
    var month = ("0" + (now.getMonth())).slice(-2);
    var today = now.getFullYear() + "-" + (month) + "-" + (day);
    $('#fromDate').val(today);
}