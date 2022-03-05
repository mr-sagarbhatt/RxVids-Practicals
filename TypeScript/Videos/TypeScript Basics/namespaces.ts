// * Namespace
// created using namespace keyword
namespace Membership {
  export function addMember(name: string) {
    console.log(name);
  }
  // * Nested Namespace
  export namespace Cards {
    export function issueCard(menberNumber: number) {
      console.log(menberNumber);
    }
  }
}
