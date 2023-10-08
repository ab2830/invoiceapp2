class BillingItem {
int index;
  String itemName;
int itemID;
  int quantity;
  double rate=0.0;
  double? newprice;

  double price;


  BillingItem(
      { required this.itemID,required this.rate,  required this.index,required this.itemName, required this.price, required this.quantity,this.newprice});


}
// - Dashboard par data static che --dyanmic
// - logout not working--done
// - login not validate I can enter anything-its working
// - OTP screen par static number aave che-done
// - MFA Google Authenticator pending-yes
// - Dashboard na arrow icon par Kai thatu nahi-not in design
// - create bill ma date automatically aavi joye aaj ni ene change karvi hoy to kari sake-done
// - bill na form ma place holder font small che koi ma koi ma mota font che-
// - border colour no same grey koi ma black -done
// - text format not appropriate
// - car ni brand aave che but car name nahi form ma--api
// - tyre size search not working-api
// - search not working on tyre company name-api
// - no back button on search page--done
// - warranty default set KM client can change
// - radio button not proper aligned and not work when click on text
// - while enter tyre price that 0 value will remove, now I need to remove that 0 then type original value
// - bill value not refl
// ect on total if we direct click on 2 nd tyre rate box and enter the amount
// - bill not save
// - pdf and print pending




