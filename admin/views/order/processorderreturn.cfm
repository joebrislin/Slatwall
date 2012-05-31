<!---

    Slatwall - An Open Source eCommerce Platform
    Copyright (C) 2011 ten24, LLC

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
 
    As a special exception, the copyright holders of this library give you
    permission to link this library with independent modules to produce an
    executable, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting executable under
    terms of your choice, provided that you also meet, for each linked
    independent module, the terms and conditions of the license of that
    module.  An independent module is a module which is not derived from
    or based on this library.  If you modify this library, you may extend
    this exception to your version of the library, but you are not
    obligated to do so.  If you do not wish to do so, delete this
    exception statement from your version.

Notes:

--->
<cfparam name="rc.returnAction" type="string" default="admin:order.listorderfulfillment" />
<cfparam name="rc.processOrderReturnSmartList" type="any" />
<cfparam name="rc.multiProcess" type="boolean" />

<cfoutput>
	<cf_SlatwallProcessForm>
		<cf_SlatwallActionBar type="process" />
		
		<cf_SlatwallProcessOptionBar>
			<cf_SlatwallProcessOption data="locationID" fieldType="select" valueOptions="#$.slatwall.getService("locationService").getLocationOptions()#" />
			<cf_SlatwallProcessOption data="boxCount" fieldType="text" />
			<cf_SlatwallProcessOption data="packingSlipNumber" fieldType="text" />
			<cf_SlatwallProcessOption data="processCreditCard" fieldType="yesno" />
		</cf_SlatwallProcessOptionBar>
		
		<cf_SlatwallProcessListing processSmartList="#rc.processOrderReturnSmartList#" processRecordsProperty="orderReturnItems" processHeaderString="Order: ${order.orderNumber}, Order Return - ${returnLocation.locationName}">
			<cf_SlatwallProcessColumn tdClass="primary" propertyIdentifier="sku.product.title" />
			<cf_SlatwallProcessColumn propertyIdentifier="sku.skuCode" />
			<cf_SlatwallProcessColumn propertyIdentifier="sku.optionsDisplay" />
			<cf_SlatwallProcessColumn propertyIdentifier="quantity" />
			<cf_SlatwallProcessColumn propertyIdentifier="quantityUnreceived" />
			<cf_SlatwallProcessColumn data="quantityReceived" fieldType="text" fieldClass="span1 number" />
		</cf_SlatwallProcessListing>
		
	</cf_SlatwallProcessForm>
</cfoutput>