// Get the "book" parameter from the URL
const params = new URLSearchParams(window.location.search);
const book = params.get('book');

// Map book names to Amazon URLs
const links = {
    foundation: "https://www.amazon.com/dp/YOUR_FOUNDATION_ASIN",
    psychology: "https://www.amazon.com/dp/YOUR_PSYCHOLOGY_ASIN",
    strategy: "https://www.amazon.com/dp/YOUR_STRATEGY_ASIN"
};

// Redirect if valid book
if (book && links[book]) {
    window.location.href = links[book];
} else {
    // Default fallback (home page or all books)
    //window.location.href = "https://www.amazon.com/hedz-forex-books";
}
