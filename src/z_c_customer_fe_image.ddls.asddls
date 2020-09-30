@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'Customer FE Image'

@UI.headerInfo:{
    imageUrl: 'CustImageURL',
    title:{ value: 'CustomerID'},
    typeName: 'Customer Detail',
    typeNamePlural: 'Customers',
    description:{ value: 'FirstName' }
}


define root view entity z_c_customer_fe_image
  as projection on Z_I_CUSTOMER_FE_IMAGE as customer
{

 @UI.facet: [{
      id: 'CustomerHeader',
      purpose:  #STANDARD ,
      type:     #IDENTIFICATION_REFERENCE,
      label:    'General Information' } ]


      @UI.selectionField: [{
          position: 10
       }]
      @UI.lineItem: [{
         position: 10
       }]
      @UI.identification:[{position: 10}]
  key customer.CustomerID,
      @UI.lineItem: [{
         position: 20
       }]
      @UI.identification:[{position: 20}]
      customer.FirstName,
      @UI.lineItem: [{
         position: 30
       }]
      @UI.identification:[{position: 30}]
      customer.LastName,
      
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VE_CUST_INITIAL'
      virtual CustInital: abap.char( 2 ),
      
      @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_VE_CUST_INITIAL'
      virtual CustImageURL: abap.string( 256 ),
      
      customer.CountryCode,
      @UI.identification:[{position: 40}]
      @UI.lineItem: [{
         position: 40
       }]
      customer.PhoneNumber,

      @UI.identification:[{position: 50}]
      @UI.lineItem: [{
         position: 50
       }]
      customer.EMailAddress,
      customer._Country
}
