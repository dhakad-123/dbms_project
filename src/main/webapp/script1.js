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
