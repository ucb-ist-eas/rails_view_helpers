# TODO

* add support for td.js-cbx
  * need to add a js file that gets installed to assets/javascripts
  * helper support?
  * doc somewhere ...
  
  // checking anywhere in a <td> will toggle a checkbox
  $('td.js-cbx').on('click', function(e) {
    if (e.target.nodeName == 'INPUT') return;
  
    $(this).find('input:checkbox').each(function() {
      $cbx = $(this);
      $cbx.prop('checked', !$cbx.prop('checked'));
    });
  });


* active record errors:
  - base only
  - all if dev
  - show per-field if no such field on page??
  - bootstrap version
  
* replace_element

## Other

* spec debug print helper.h
* have_tag