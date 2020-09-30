CLASS zcl_ve_cust_initial DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_sadl_exit_calc_element_read.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_ve_cust_initial IMPLEMENTATION.
  METHOD if_sadl_exit_calc_element_read~calculate.
    DATA customers TYPE STANDARD TABLE OF z_c_customer_fe_image WITH DEFAULT KEY.
    customers = CORRESPONDING #( it_original_data ).

    LOOP AT customers ASSIGNING FIELD-SYMBOL(<customer>).
      <customer>-CustInital =  |{ <customer>-FirstName(1) }{ <customer>-LastName(1) }|.
*      <customer>-CustImageURL = 'https://github.githubassets.com/images/modules/open_graph/github-octocat.png'.
    ENDLOOP.

    ct_calculated_data = CORRESPONDING #(  customers ).
  ENDMETHOD.

  METHOD if_sadl_exit_calc_element_read~get_calculation_info.

    LOOP AT it_requested_calc_elements ASSIGNING FIELD-SYMBOL(<fs_calc_element>).
      CASE <fs_calc_element>.
        WHEN 'CUSTINITAL'.
          APPEND 'FIRSTNAME' TO et_requested_orig_elements.
          APPEND 'LASTNAME' TO et_requested_orig_elements.
      ENDCASE.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
