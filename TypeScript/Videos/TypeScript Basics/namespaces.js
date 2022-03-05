// * Namespace
// created using namespace keyword
var Membership;
(function (Membership) {
    function addMember(name) {
        console.log(name);
    }
    Membership.addMember = addMember;
    // * Nested Namespace
    let Cards;
    (function (Cards) {
        function issueCard(menberNumber) {
            console.log(menberNumber);
        }
        Cards.issueCard = issueCard;
    })(Cards = Membership.Cards || (Membership.Cards = {}));
})(Membership || (Membership = {}));
