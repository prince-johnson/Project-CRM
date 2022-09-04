// Sidebar Trigger
document.addEventListener("DOMContentLoaded", function () {
    const options = {
        "edge": "left"
    }

    var elems = document.querySelectorAll(".sidenav");
    var instances = M.Sidenav.init(elems, options);
});

function clearFilters() {
    document.getElementsByName("checkbox").forEach(element => {
        element.checked = false;
    });
}

// Materialize Select
document.addEventListener('DOMContentLoaded', function () {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems);
});


// Search Users
function searchUser() {
    searchBy = document.getElementById("searchBy").value;
    searchConstraint = document.getElementById("searchConstraint").value;

    fetch("/admin/users/" + searchBy + "/" + searchConstraint, { method: "GET" }).then(() => (window.location.href = "/admin/users/" + searchBy + "/" + searchConstraint));
}

// Filter user-role Batch
function applyRoleFilters() {
    inputs = document.querySelectorAll(".filterCheckbox:checked");
    let roles = {
        roles: []
    };
    inputs.forEach(ip => {
        roles["roles"].push(ip.value);
    });
    if (roles["roles"] == []) {
        window.location.href = "/admin/users";
    }
    fetch("/admin/users", { method: "GET" }).then(() => (window.location.href = "/admin/users?roles=" + roles["roles"]));
}


// Back to users
function userBack() {
    window.location.href = "/admin/users"
}

// Batch 
// Close/Open Batch
function toggleBatch() {
    toggleSwitch = document.getElementById('batchSwitch')
    if (toggleSwitch.checked) {
        alert(Boolean(toggleSwitch.value))
    }
    else {
        alert(Boolean(''))
    }
}
//edit batch
function editBatch(batchId) {
    strength = document.getElementById('editBatchStrength' + batchId).value
    if (strength == 0) {
        strength = document.getElementById('editBatchStrength' + batchId).placeholder
    }
    fetch('/admin/batches/' + batchId, {
        method: 'PUT',
        body: JSON.stringify({
            batchId: batchId,
            batchName: document.getElementById('editBatchName' + batchId).value,
            batchCourseId: document.getElementById('editBatchCourseId' + batchId).value,
            batchStrength: Number(strength),
            batchStatus: Boolean(document.getElementById('editBatchStatus' + batchId).value),
            batchStartDate: document.getElementById('editBatchStartDate' + batchId).placeholder,
            batchEndDate: document.getElementById('editBatchEndDate' + batchId).placeholder
        })
    })
        .then(() => window.location.href = window.location.href);
}

// Delete Batch
function deleteBatch(batchId) {
    fetch('/admin/batches/' + batchId, {
        method: 'DELETE'
    })
    .then(() => window.location.href = "/admin/batches");
}

// Search Batch
function searchBatch(date) {
    if (date != 'date') {
        searchBy = document.getElementById('searchBy').value
        searchConstraint = document.getElementById('searchConstraint').value
    }
    else {
        searchBy = 'date'
        searchConstraint = document.getElementById('branchStartDateSearch').value
    }
    fetch('/batches/' + searchBy + '/' + searchConstraint, {
        method: 'GET'
    })
        .then(() => window.location.href = "/admin/batches/" + searchBy + '/' + searchConstraint);
}

// Filter category-Batch
function applyBatchFilters() {
    inputs = document.querySelectorAll(".filterCheckbox:checked");
    let status = {
        status: []
    };
    inputs.forEach(ip => {
        status["status"].push(ip.value);
    });
    fetch("/admin/batches", { method: "GET" }).then(() => (window.location.href = "/admin/batches?status=" + status["status"]));
}

// Get date picked
function getDate() {
    console.log(document.getElementById('batchStartDate').value)
}

// Back to batches
function batchBack() {
    window.location.href = "/admin/batches"
}

//Enquiry
// Close/Open enquiry
function toggleEnquiry() {
    toggleSwitch = document.getElementById('enquirySwitch')
    if (toggleSwitch.checked) {
        alert(Boolean(toggleSwitch.value))
    }
    else {
        alert(Boolean(''))
    }
}

// Search Enquiry
function searchEnquiry(date) {
    if (date != 'date') {
        searchBy = document.getElementById('searchBy').value
        searchConstraint = document.getElementById('searchConstraint').value
    }
    else {
        searchBy = 'date'
        searchConstraint = document.getElementById('branchStartDateSearch').value
    }
    fetch('/enquiries/' + searchBy + '/' + searchConstraint, {
        method: 'GET'
    })
        .then(() => window.location.href = "/admin/enquiries/" + searchBy + '/' + searchConstraint);
}

//edit enquiry
function editEnquiry(enquiryId) {
    enquiryDescription = document.getElementById('editenquiryDescription' + enquiryId).value
    if (enquiryDescription == '') {
        enquiryDescription = document.getElementById('editenquiryDescription' + enquiryId).placeholder
    }
    fetch('/admin/enquiries/' + enquiryId, {
        method: 'PUT',
        body: JSON.stringify({
            enquiryId: enquiryId,
            enquiryUserId: document.getElementById('editenquiryUserId' + enquiryId).value,
            enquiryCourseId: document.getElementById('editenquiryCourseId' + enquiryId).value,
            enquiryDescription: enquiryDescription,
            enquiryStatus: document.getElementById('editenquiryStatus' + enquiryId).value,
        })
    })
        .then(() => window.location.href = window.location.href);
}
// Back to enquiries
function enquiryBack() {
    window.location.href = "/admin/enquiries"
}

//Courses
//Edit Course
function editCourse(courseId) {
    courseDescription = document.getElementById("editCourseDescription" + courseId).value;
    if (courseDescription == "") {
        courseDescription = document.getElementById("editCourseDescription" + courseId).placeholder;
    }
    alert(courseDescription);
    fetch("/admin/courses/" + courseId, {
        method: 'PUT',
        body: JSON.stringify({
            courseCategoryId: document.getElementById("editCourseCategoryId" + courseId).value,
            courseName: document.getElementById("editCourseName" + courseId).value,
            courseDuration: document.getElementById("editCourseDuration" + courseId).value,
            courseStatus: document.getElementById("editCourseStatus" + courseId).value,
            courseDescription: courseDescription,
            courseInstructorId: document.getElementById("editcourseInstructorId" + courseId).value,
            courseMinQualificationId: document.getElementById("editCourseMinQualificationId" + courseId).value,
            courseBatchSize: document.getElementById("editCourseBatchSize" + courseId).value,
            courseSyllabus: null,
            courseUrl: document.getElementById("editCourseUrl" + courseId).value
        })
    }).then(() => (window.location.href = window.location.href));
}

//Search Course
function searchCourse() {
    searchBy = document.getElementById("searchBy").value;
    searchConstraint = document.getElementById("searchConstraint").value;

    fetch("/admin/courses/" + searchBy + "/" + searchConstraint, {
        method: "GET"
    })
        .then(() => (window.location.href = "/admin/courses/" + searchBy + "/" + searchConstraint));
}

//Delete Course
function deleteCourse(courseId) {
    fetch("/admin/courses/" + courseId, {
        method: "DELETE"
    })
        .then(() => (window.location.href = "/admin/courses"));
}

// Filter Courses
function applyCourseFilters() {
    inputs = document.querySelectorAll(".filterCheckbox:checked");
    let status = {
        status: []
    };
    inputs.forEach(ip => {
        status["status"].push(ip.value);
    });
    if (status["status"] == []) {
        window.location.href = "/admin/courses";
    }
    fetch("/admin/users", {
        method: "GET"
    })
        .then(() => (window.location.href = "/admin/courses?status=" + status["status"]));
}

// Back to courses
function courseBack() {
    window.location.href = "/admin/courses";
}



//Category
// Close/Open category
function toggleCategory() {
    toggleSwitch = document.getElementById('categorySwitch')
    if (toggleSwitch.checked) {
        alert(Boolean(toggleSwitch.value))
    }
    else {
        alert(Boolean(''))
    }
}

// Delete Category
function deleteCategory(categoryId) {
    fetch('/categories/' + categoryId, {
        method: 'DELETE'
    })
        .then(() => window.location.href = "/admin/categories");
}

// Search Category
function searchCategory() {
    searchBy = document.getElementById('searchBy').value
    searchConstraint = document.getElementById('searchConstraint').value
    fetch('/categories/' + searchBy + '/' + searchConstraint, {
        method: 'GET'
    })
        .then(() => window.location.href = "/admin/categories/" + searchBy + '/' + searchConstraint);
}

//editing category
function editCategory(categoryId) {
    comments = document.getElementById('editCategoryComments' + categoryId).value
    if (comments == 0) {
        comments = document.getElementById('editCategoryComments' + categoryId).placeholder
    }
    fetch('/admin/categories/' + categoryId, {
        method: 'PUT',
        body: JSON.stringify({
            categoryId: categoryId,
            categoryName: document.getElementById('editCategoryName' + categoryId).placeholder,
            categoryStatus: Boolean(document.getElementById('editCategoryStatus' + categoryId).value),
            categoryComments: comments
        })
    })
        .then(() => window.location.href = window.location.href);
}

// Back to categories
function categoryBack() {
    window.location.href = "/admin/categories"
}

//Qualification
// Close/Open qualification
function toggleQualification() {
    toggleSwitch = document.getElementById('qualSwitch')
    if (toggleSwitch.checked) {
        alert(Boolean(toggleSwitch.value))
    }
    else {
        alert(Boolean(''))
    }
}

//Delete Qualification
function deleteQualification(qualificationId) {
    fetch('/qualification/' + qualificationId, {
        method: 'DELETE'
    })
        .then(() => window.location.href = "/admin/qualification");
}

// Search Qualification
function searchQualification() {
    searchBy = document.getElementById('searchBy').value
    searchConstraint = document.getElementById('searchConstraint').value
    fetch('/qualification/' + searchBy + '/' + searchConstraint, {
        method: 'GET'
    })
        .then(() => window.location.href = "/admin/qualification/" + searchBy + '/' + searchConstraint);
}

//editing Qualification -- doubt
function editQualification(qualificationId) {
    fetch('/admin/qualification/' + qualificationId, {
        method: 'PUT',
        body: JSON.stringify({
            qualificationId: qualificationId,
            qualificationName: document.getElementById('editQualificationName' + qualificationId).placeholder,
            qualificationStatus: document.getElementById('editQualificationStatus' + qualificationId).value,
        })
    })
        .then(() => window.location.href = window.location.href);
}

// Back to Qualification
function qualificationBack() {
    window.location.href = "/admin/qualification"
}

//Chart
// Building Chart

function BuildChart(labels, values, chartTitle) {


    var ctx = document.getElementById("myChart").getContext("2d");

    var myChart = new Chart(ctx, {
        type: "line",
        data: {
            labels: labels, // Our labels
            datasets: [
                {
                    fill: false,
                    label: chartTitle, // Name the series
                    data: values, // Our values
                    borderColor: [// Add custom color borders
                        "rgba(82, 171, 152, 1)"],
                    borderWidth: 2 // Specify bar border width
                }
            ]
        },
        options: {
            responsive: true, // Instruct chart js to respond nicely.
            maintainAspectRatio: false, // Add to prevent default behavior of full-width/height
            scales: {
                xAxes: [
                    {
                        gridLines: {
                            display: false
                        }
                    }
                ],
                yAxes: [
                    {
                        gridLines: {
                            display: false
                        },
                        ticks: {
                            beginAtZero: true
                        }
                    }
                ]
            }
        }
    });
    return myChart;
}

var table = document.getElementById("dataTable");
var json = []; // First row needs to be headers
var headers = [];
for (var i = 0; i < table.rows[0].cells.length; i++) {
    headers[i] = table.rows[0].cells[i].innerHTML.toLowerCase().replace(/ /gi, "");
}

// Go through cells
for (var i = 1; i < table.rows.length; i++) {
    var tableRow = table.rows[i];
    var rowData = {};
    for (var j = 0; j < tableRow.cells.length; j++) {
        rowData[headers[j]] = tableRow.cells[j].innerHTML;
    }

    json.push(rowData);
}

console.log(json);

// Map JSON values back to label array
var labels = json.map(function (e) {
    return e.date;
});
console.log(labels);

// Map JSON values back to values array
var values = json.map(function (e) {
    return e.logincount;
});
console.log(values);

var chart = BuildChart(labels, values, "Login Count of users");


//Pagination
$(document).ready(function () {
    $('#page').materializePagination({
        align: 'center',
        lastPage: 10,
        firstPage: 1,
        useUrlParameter: false,
        perPage: 7,
        onClickCallback: function (requestedPage) {
            console.log('Requested page from #pagination-long: ' + requestedPage);
        }
    });
});





//USER-SIDE

// Search Courses
function userSearchCourse() {
    searchBy = document.getElementById("searchBy").value;
    searchConstraint = document.getElementById("searchConstraint").value;
    alert(searchBy+","+searchConstraint)
    fetch("/user/" + searchBy + "/" + searchConstraint, {
        method: "GET"
    })
        .then(() => (window.location.href = "/user/" + searchBy + "/" + searchConstraint));
}

// Back to dashboard
function userDashBack() {
    window.location.href = "/user/"
}


// Search Enquiry
function userSearchEnquiry(date) {
    if (date != 'date') {
        searchBy = document.getElementById('searchBy').value
        searchConstraint = document.getElementById('searchConstraint').value
    }
    else {
        searchBy = 'date'
        searchConstraint = document.getElementById('branchStartDateSearch').value
    }
    fetch('/enquiries/' + searchBy + '/' + searchConstraint, {
        method: 'GET'
    })
        .then(() => window.location.href = "/user/enquiries/" + searchBy + '/' + searchConstraint);
}

// Filter Courses
function applyUserEnquiryFilters() {
    inputs = document.querySelectorAll(".filterCheckbox:checked");
    let status = {
        status: []
    };
    inputs.forEach(ip => {
        status["status"].push(ip.value);
    });
    if (status["status"] == []) {
        window.location.href = "/user/enquiries";
    }
    fetch("/user", {
        method: "GET"
    })
        .then(() => (window.location.href = "/user/enquiries?status=" + status["status"]));
}

// Back to enquiries
function userEnquiryBack() {
    window.location.href = "/user/enquiries"
}

// Back to login
function changeBack() {
    window.location.href = "/"
}

// Change Password
function changePass(){
    const form = document.getElementById("changeform");
    const email = document.getElementById("userEmail");
    const pswd1 = document.getElementById("userPass1");
    const pswd2 = document.getElementById("userPass2");
    
    
    form.addEventListener('submit', (e) => {
        e.preventDefault();
        console.log("Inside eventListener");
        var success = checkInputs(email, pswd1, pswd2);
        console.log('Inputs checked!');
        if (success) {
            console.log('Success');
            fetch("/changepassword", {
                method: "POST",
                body: JSON.stringify({
                    email: email.value,
                    pass: pswd1.value
                })
            })
            .then(() => {window.location.href = window.location.href})
        }
    });
}

function checkInputs(email, pswd1, pswd2) {
    const emailValue = email.value.trim();
    const pswdValue = pswd1.value.trim();
    const pswd2Value = pswd2.value.trim();
    var success = true

    if(emailValue === '') {
        success = false;
        setErrorFor(email, 'Email cannot be blank');
    }else if(!isEmail(emailValue)) {
        success = false;
        setErrorFor(email, "Email is not valid");
    }else{
        success = true;
        setSuccessFor(email);
    }

    if(pswdValue === '') {
        success = false;
        setErrorFor(pswd1, 'Password cannot be blank');
    }else if (!(pswd2Value.length >= 6 && pswd2Value.length <= 20)) {
        success = false;
        setErrorFor(pswd1, 'Password must be 6-20 characters long');
    }else {
        success = true;
        setSuccessFor(pswd1);
    }

    if(pswd2Value === '') {
        success = false;
        setErrorFor(pswd2, 'Password cannot be blank');
    }else if (pswdValue !== pswd2Value) {
        success = false;
        setErrorFor(pswd2, 'Passwords do not match');
    }else {
        success = true;
        setSuccessFor(pswd2);
    }

    function setErrorFor(input, message) {
        const formControl = input.parentElement.parentElement;
        const small = formControl.querySelector("small");

        small.innerText = message;

        formControl.className = "input-field col s12 err";
    }

    function setSuccessFor(input) {
        const formControl = input.parentElement;
        formControl.className = "input-field col s12 success";
    }

    function isEmail(email) {
        return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
    }

    return success;
}