const taglineTexts = [
  "Smarter Spending, Brighter Tomorrow.",
  "Manage your finances efficiently",
  "Stay on top of your spending",
  "Budget Better, Live Brighter."
];

const taglineElement = document.getElementById("tagline");
let currentTaglineIndex = 0;
let currentTextIndex = 0;
let isTyping = true;

function typeTagline() {
  const currentTagline = taglineTexts[currentTaglineIndex];
  const currentText = currentTagline.slice(0, currentTextIndex + 1);

  taglineElement.textContent = currentText;

  currentTextIndex++;

  if (currentTextIndex > currentTagline.length) {
    isTyping = false;
    setTimeout(eraseTagline, 1600);
  } else {
    setTimeout(typeTagline, 100);
  }
}

function eraseTagline() {
  const currentTagline = taglineTexts[currentTaglineIndex];
  const currentText = currentTagline.slice(0, currentTextIndex - 1);

  taglineElement.textContent = currentText;

  currentTextIndex--;

  if (currentTextIndex === 0) {
    isTyping = true;
    currentTaglineIndex = (currentTaglineIndex + 1) % taglineTexts.length;
    setTimeout(typeTagline, 500);
  } else {
    setTimeout(eraseTagline, 50);
  }
}

typeTagline();
/* code for toggling content of dashboard navbar */

function changeContent(contentId) {
    const dynamicContent = document.getElementById('dynamic-content');
    let content = '';
  
    if (contentId === 'profile') {
      content = getProfile();
    } else if (contentId === 'change pwd') {
      content = getChangePwd();
    } else if (contentId === 'add expense') {
      content = getaddexpense();
    }else if (contentId === 'dashboard') {
      content = getdashboard();
    }
  
    dynamicContent.innerHTML = content;
  }
  
  function getdashboard() {
    return `
    <div class="dashboard">
    <div class="box box-total">
      <h2>Total Expenses (Last 7 Days)</h2>
      <p id="lastSevenDaysExpense">$0</p>
    </div>
    <div class="box box-total">
      <h2>Total Expenses (Last Month)</h2>
      <p id="lastMonthExpense">$0</p>
    </div>
    <div class="box box-total">
      <h2>Total Expenses (Last Year)</h2>
      <p id="lastYearExpense">$0</p>
    </div>
    <div class="box box-current">
      <h2>Current Expenses</h2>
      <p id="currentExpense">$0</p>
    </div>
  </div>
    `}
  function getProfile() {
    return `
    <div id="registration-form">
  <div class='fieldset'>
    <legend>Profile</legend>
    <form action="UpdateProfileServlet" method="post" data-validate="parsley">
      <div class='row'>
        <label for='firstname'>Full Name</label>
        <input type="text" placeholder="full Name" name='fullname' id='firstname' data-required="true" data-error-message="Your First Name is required">
      </div>
      <div class='row'>
        <label for="email">E-mail</label>
        <input type="text" placeholder="abc@gmail.com"  name='email' data-required="true" data-type="email" data-error-message="Your E-mail is required">
      </div>
      <div class='row'>
        <label for="cemail">Mobile Number</label>
        <input type="text" placeholder="8467099999" name='mobileNumber' data-required="true" data-error-message="Your E-mail must correspond">
      </div>
   
      <input type="submit" value="Update">
    </form>
  </div>
</div>
  `;
  }
  
  function getChangePwd() {
    return `
    <div id="registration-form">
  <div class='fieldset'>
    <legend>Change Password</legend>
    <form action="ChangePasswordServlet" method="post" data-validate="parsley">
      <div class='row'>
        <label for='firstname'>Current password</label>
        <input type="password" placeholder="........." name='currentPassword' id='firstname' data-required="true" data-error-message="Your First Name is required">
      </div>
      <div class='row'>
        <label for="email">New password</label>
        <input type="password" placeholder=".........."  name='newPassword' data-required="true" data-type="email" data-error-message="Your E-mail is required">
      </div>
      <div class='row'>
        <label for="cemail">confirm password</label>
        <input type="password" placeholder=".........." name='confirmPassword' data-required="true" data-error-message="Your E-mail must correspond">
      </div>
      
      <input type="submit" value="Change">
    </form>
  </div>
</div>
  `;
  }
  
  function getaddexpense() {
    return `
    <div id="registration-form">
  <div class='fieldset'>
    <legend>Expense</legend>
    <form action="#" method="post" data-validate="parsley">
      <div class='row'>
        <label for='firstname'>Date of Expense</label>
        <input type="date" placeholder="" name='firstname' id='firstname' data-required="true" data-error-message="Your First Name is required">
      </div>
      <div class='row'>
        <label for="email">Item</label>
        <input type="text" placeholder=""  name='email' data-required="true" data-type="email" data-error-message="Your E-mail is required">
      </div>
      <div class='row'>
        <label for="cemail">Cost of Item</label>
        <input type="text" placeholder="" name='cemail' data-required="true" data-error-message="Your E-mail must correspond">
      </div>
      
      <input type="submit" value="Add">
      
    </form>
    
  </div>
</div>
  `;
  }
  
  
  
  function placeholderIsSupported() {
    test = document.createElement('input');
    return ('placeholder' in test);
  }

$(document).ready(function(){
  placeholderSupport = placeholderIsSupported() ? 'placeholder' : 'no-placeholder';
  $('html').addClass(placeholderSupport);  
});
  
  



