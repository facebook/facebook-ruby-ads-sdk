# Copyright (c) 2017-present, Facebook, Inc. All rights reserved.
#
# You are hereby granted a non-exclusive, worldwide, royalty-free license to use,
# copy, modify, and distribute this software in source code or binary form for use
# in connection with the web services and APIs provided by Facebook.
#
# As with any software that integrates with the Facebook platform, your use of
# this software is subject to the Facebook Platform Policy
# [http://developers.facebook.com/policy/]. This copyright notice shall be
# included in all copies or substantial portions of the software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
# FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
# COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
# IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
# CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# FB:AUTOGEN

module FacebookAds
  # This class is auto-generated.

  # For any issues or feature requests related to this class, please let us know
  # on github and we'll fix in our codegen framework. We'll not be able to accept
  # pull request for this class.

  class Business < AdObject
    TWO_FACTOR_TYPE = [
      "none",
      "admin_required",
      "all_required",
    ]

    VERTICAL = [
      "ADVERTISING",
      "AUTOMOTIVE",
      "CONSUMER_PACKAGED_GOODS",
      "ECOMMERCE",
      "EDUCATION",
      "ENERGY_AND_UTILITIES",
      "ENTERTAINMENT_AND_MEDIA",
      "FINANCIAL_SERVICES",
      "GAMING",
      "GOVERNMENT_AND_POLITICS",
      "MARKETING",
      "ORGANIZATIONS_AND_ASSOCIATIONS",
      "PROFESSIONAL_SERVICES",
      "RETAIL",
      "TECHNOLOGY",
      "TELECOM",
      "TRAVEL",
      "NON_PROFIT",
      "RESTAURANT",
      "HEALTH",
      "LUXURY",
      "OTHER",
    ]

    ACCESS_TYPE = [
      "OWNER",
      "AGENCY",
    ]

    PERMITTED_TASKS = [
      "MANAGE",
      "ADVERTISE",
      "ANALYZE",
    ]

    PAGE_PERMITTED_ROLES = [
      "MANAGER",
      "CONTENT_CREATOR",
      "MODERATOR",
      "ADVERTISER",
      "INSIGHTS_ANALYST",
    ]

    SURVEY_BUSINESS_TYPE = [
      "AGENCY",
      "ADVERTISER",
      "APP_DEVELOPER",
      "PUBLISHER",
    ]

    PERMITTED_ROLES = [
      "MANAGER",
      "CONTENT_CREATOR",
      "MODERATOR",
      "ADVERTISER",
      "INSIGHTS_ANALYST",
    ]

    ROLE = [
      "FINANCE_EDITOR",
      "FINANCE_ANALYST",
      "ADS_RIGHTS_REVIEWER",
      "ADMIN",
      "EMPLOYEE",
      "FB_EMPLOYEE_SALES_REP",
    ]


    field :block_offline_analytics, 'bool'
    field :created_by, 'object'
    field :created_time, 'datetime'
    field :extended_updated_time, 'datetime'
    field :id, 'string'
    field :is_hidden, 'bool'
    field :is_instagram_enabled_in_fb_analytics, 'bool'
    field :link, 'string'
    field :name, 'string'
    field :payment_account_id, 'string'
    field :primary_page, 'Page'
    field :profile_picture_uri, 'string'
    field :timezone_id, 'int'
    field :two_factor_type, 'string'
    field :updated_by, 'object'
    field :updated_time, 'datetime'
    field :verification_status, 'string'
    field :vertical, 'string'
    field :vertical_id, 'int'
    has_no_delete

    has_edge :access_token do |edge|
      edge.post 'Business' do |api|
        api.has_param :app_id, 'object'
        api.has_param :scope, 'object'
      end
    end

    has_edge :ad_monetization_properties do |edge|
      edge.get 'AdMonetizationProperty'
    end

    has_edge :ad_studies do |edge|
      edge.get 'AdStudy'
      edge.post 'AdStudy' do |api|
        api.has_param :cells, { list: 'object' }
        api.has_param :objectives, { list: 'object' }
        api.has_param :end_time, 'int'
        api.has_param :description, 'string'
        api.has_param :name, 'string'
        api.has_param :start_time, 'int'
        api.has_param :viewers, { list: 'int' }
        api.has_param :cooldown_start_time, 'int'
        api.has_param :observation_end_time, 'int'
        api.has_param :confidence_level, 'double'
        api.has_param :client_business, 'string'
        api.has_param :type, { enum: -> { AdStudy::TYPE }}
      end
    end

    has_edge :adaccount do |edge|
      edge.post 'AdAccount' do |api|
        api.has_param :name, 'string'
        api.has_param :currency, 'string'
        api.has_param :timezone_id, 'int'
        api.has_param :end_advertiser, 'object'
        api.has_param :funding_id, 'string'
        api.has_param :media_agency, 'string'
        api.has_param :partner, 'string'
        api.has_param :invoice, 'bool'
        api.has_param :po_number, 'string'
        api.has_param :io, 'bool'
        api.has_param :billing_address_id, 'object'
        api.has_param :sold_to_address_id, 'object'
        api.has_param :liable_address_id, 'object'
        api.has_param :invoice_group_id, 'object'
      end
    end

    has_edge :adaccountcreationrequests do |edge|
      edge.get 'AdAccountCreationRequest' do |api|
        api.has_param :status, { list: { enum: -> { AdAccountCreationRequest::STATUS }} }
      end
      edge.post 'AdAccountCreationRequest' do |api|
        api.has_param :extended_credit_id, 'object'
        api.has_param :ad_accounts_info, { list: 'object' }
        api.has_param :business_registration, 'file'
        api.has_param :planning_agency_business_id, 'string'
        api.has_param :english_legal_entity_name, 'string'
        api.has_param :legal_entity_name_in_local_language, 'string'
        api.has_param :chinese_legal_entity_name, 'string'
        api.has_param :address_in_chinese, 'string'
        api.has_param :address_in_local_language, 'string'
        api.has_param :address_in_english, 'object'
        api.has_param :official_website_url, 'object'
        api.has_param :business_registration_id, 'string'
        api.has_param :vertical, { enum: -> { AdAccountCreationRequest::VERTICAL }}
        api.has_param :subvertical, { enum: -> { AdAccountCreationRequest::SUBVERTICAL }}
        api.has_param :promotable_page_urls, { list: 'object' }
        api.has_param :promotable_page_ids, { list: 'string' }
        api.has_param :promotable_app_ids, { list: 'string' }
        api.has_param :promotable_urls, { list: 'object' }
        api.has_param :contact, 'object'
        api.has_param :additional_comment, 'string'
        api.has_param :is_smb, 'bool'
        api.has_param :is_test, 'bool'
        api.has_param :advertiser_business_id, 'string'
      end
    end

    has_edge :adaccounts do |edge|
      edge.delete do |api|
        api.has_param :adaccount_id, 'string'
      end
    end

    has_edge :adnetworkanalytics do |edge|
      edge.get 'AdNetworkAnalyticsSyncQueryResult' do |api|
        api.has_param :aggregation_period, { enum: -> { AdNetworkAnalyticsSyncQueryResult::AGGREGATION_PERIOD }}
        api.has_param :breakdowns, { list: { enum: -> { AdNetworkAnalyticsSyncQueryResult::BREAKDOWNS }} }
        api.has_param :filters, { list: 'hash' }
        api.has_param :limit, 'int'
        api.has_param :metrics, { list: { enum: -> { AdNetworkAnalyticsSyncQueryResult::METRICS }} }
        api.has_param :ordering_column, { enum: -> { AdNetworkAnalyticsSyncQueryResult::ORDERING_COLUMN }}
        api.has_param :ordering_type, { enum: -> { AdNetworkAnalyticsSyncQueryResult::ORDERING_TYPE }}
        api.has_param :since, 'object'
        api.has_param :until, 'object'
      end
      edge.post 'Business' do |api|
        api.has_param :aggregation_period, { enum: -> { AdNetworkAnalyticsSyncQueryResult::AGGREGATION_PERIOD }}
        api.has_param :breakdowns, { list: { enum: -> { AdNetworkAnalyticsSyncQueryResult::BREAKDOWNS }} }
        api.has_param :metrics, { list: { enum: -> { AdNetworkAnalyticsSyncQueryResult::METRICS }} }
        api.has_param :filters, { list: 'object' }
        api.has_param :limit, 'int'
        api.has_param :ordering_column, { enum: -> { AdNetworkAnalyticsSyncQueryResult::ORDERING_COLUMN }}
        api.has_param :ordering_type, { enum: -> { AdNetworkAnalyticsSyncQueryResult::ORDERING_TYPE }}
        api.has_param :since, 'object'
        api.has_param :until, 'object'
      end
    end

    has_edge :adnetworkanalytics_export do |edge|
      edge.get 'AdNetworkAnalyticsAsyncQueryExport' do |api|
        api.has_param :query_ids, { list: 'string' }
      end
    end

    has_edge :adnetworkanalytics_results do |edge|
      edge.get 'AdNetworkAnalyticsAsyncQueryResult' do |api|
        api.has_param :query_ids, { list: 'string' }
      end
    end

    has_edge :ads_reporting do |edge|
      edge.get 'AdsReportBuilder' do |api|
        api.has_param :attribution_windows, { list: { enum: -> { AdsReportBuilder::ATTRIBUTION_WINDOWS }} }
        api.has_param :dimensions, { list: { enum: -> { AdsReportBuilder::DIMENSIONS }} }
        api.has_param :dimension_groups, { list: { list: 'businessads_reporting_dimension_groups_enum_param' } }
        api.has_param :locked_dimensions, 'int'
        api.has_param :metrics, { list: 'string' }
        api.has_param :filtering, 'object'
        api.has_param :sorting, { list: 'hash' }
        api.has_param :date_preset, { enum: -> { AdsReportBuilder::DATE_PRESET }}
        api.has_param :time_range, 'object'
        api.has_param :default_summary, 'bool'
        api.has_param :last_report_snapshot_id, 'int'
        api.has_param :offset, 'int'
        api.has_param :limit, 'int'
        api.has_param :summary_count, 'bool'
      end
    end

    has_edge :adspixels do |edge|
      edge.get 'AdsPixel' do |api|
        api.has_param :name_filter, 'string'
        api.has_param :id_filter, 'string'
        api.has_param :sort_by, { enum: -> { AdsPixel::SORT_BY }}
      end
      edge.post 'AdsPixel' do |api|
        api.has_param :name, 'string'
      end
    end

    has_edge :advertisable_applications do |edge|
      edge.get 'BusinessAdvertisableApplicationsResult' do |api|
        api.has_param :adaccount_id, 'int'
        api.has_param :offset, 'int'
      end
    end

    has_edge :agencies do |edge|
      edge.delete do |api|
        api.has_param :business, 'string'
      end
    end

    has_edge :agency_pages do |edge|
      edge.get 'Page' do |api|
        api.has_param :agency_id, 'string'
      end
    end

    has_edge :an_publisher_blocklist_apps do |edge|
      edge.get 'AppPublisher' do |api|
        api.has_param :app_ids, { list: 'object' }
      end
    end

    has_edge :an_publisher_blocklist_categories do |edge|
      edge.get 'AnBlockedBiCategory'
    end

    has_edge :an_publisher_blocklist_domains do |edge|
      edge.get 'WebPublisher' do |api|
        api.has_param :domain_ids, { list: 'object' }
      end
    end

    has_edge :an_publisher_blocklist_pages do |edge|
      edge.get 'PagePublisher' do |api|
        api.has_param :page_ids, { list: 'object' }
      end
    end

    has_edge :analytics_query do |edge|
      edge.get 'AnalyticsQueryResult' do |api|
        api.has_param :query_ids, { list: 'string' }
      end
    end

    has_edge :analytics_query_export do |edge|
      edge.get 'AnalyticsQueryExportResult' do |api|
        api.has_param :query_ids, { list: 'string' }
      end
    end

    has_edge :apps do |edge|
      edge.delete do |api|
        api.has_param :app_id, 'int'
      end
      edge.post 'Business' do |api|
        api.has_param :app_id, 'object'
        api.has_param :access_type, { enum: -> { Business::ACCESS_TYPE }}
      end
    end

    has_edge :assigned_ad_accounts do |edge|
      edge.get 'AdAccount' do |api|
        api.has_param :user_id, 'int'
        api.has_param :email, 'string'
      end
    end

    has_edge :assigned_adimages do |edge|
      edge.get 'AdImage'
    end

    has_edge :assigned_customaudiences do |edge|
      edge.get 'CustomAudience'
    end

    has_edge :assigned_monetization_properties do |edge|
      edge.get 'AdMonetizationProperty' do |api|
        api.has_param :user_id, 'int'
        api.has_param :email, 'string'
      end
    end

    has_edge :assigned_pagephotos do |edge|
      edge.get 'Photo'
    end

    has_edge :assigned_pages do |edge|
      edge.get 'Page' do |api|
        api.has_param :user_id, 'int'
        api.has_param :email, 'string'
      end
    end

    has_edge :assigned_product_catalogs do |edge|
      edge.get 'ProductCatalog' do |api|
        api.has_param :user_id, 'int'
        api.has_param :email, 'string'
      end
    end

    has_edge :assigned_savedaudiences do |edge|
      edge.get 'SavedAudience'
    end

    has_edge :big_data_upload do |edge|
      edge.get 'BigDataUploadSession'
    end

    has_edge :block_list_drafts do |edge|
      edge.post 'Business' do |api|
        api.has_param :publisher_urls_file, 'file'
      end
    end

    has_edge :business_activities do |edge|
      edge.get 'BusinessActivityLogEvent' do |api|
        api.has_param :business, 'string'
      end
    end

    has_edge :business_invoices do |edge|
      edge.get 'OracleTransaction' do |api|
        api.has_param :start_date, 'string'
        api.has_param :end_date, 'string'
      end
    end

    has_edge :business_persona do |edge|
      edge.get 'BusinessPersona'
    end

    has_edge :business_resource_groups do |edge|
      edge.get 'BusinessResourceGroup'
    end

    has_edge :business_units do |edge|
      edge.get 'BusinessUnit'
    end

    has_edge :business_users do |edge|
      edge.get 'BusinessUser'
      edge.post 'BusinessUser' do |api|
        api.has_param :email, 'string'
        api.has_param :role, { enum: -> { BusinessUser::ROLE }}
      end
    end

    has_edge :businessprojects do |edge|
      edge.get 'BusinessProject'
      edge.post 'BusinessProject' do |api|
        api.has_param :name, 'string'
      end
    end

    has_edge :businesssettinglogs do |edge|
      edge.get 'BusinessSettingLogsData'
    end

    has_edge :catalog_segment_producer_tos do |edge|
      edge.get 'BusinessProductCatalogTos' do |api|
        api.has_param :catalog_segment_id, 'string'
      end
      edge.post 'Business' do |api|
        api.has_param :catalog_segment_id, 'string'
      end
    end

    has_edge :claim_custom_conversions do |edge|
      edge.post 'CustomConversion' do |api|
        api.has_param :custom_conversion_id, 'string'
      end
    end

    has_edge :client_ad_account_requests do |edge|
      edge.get 'BusinessAdAccountRequest'
    end

    has_edge :client_ad_accounts do |edge|
      edge.get 'AdAccount'
      edge.post 'Business' do |api|
        api.has_param :adaccount_id, 'string'
        api.has_param :permitted_tasks, { list: { enum: -> { Business::PERMITTED_TASKS }} }
      end
    end

    has_edge :client_apps do |edge|
      edge.get 'Application'
      edge.post 'Business' do |api|
        api.has_param :app_id, 'object'
      end
    end

    has_edge :client_leads_access do |edge|
      edge.get 'PageLeadsAccessConfig'
    end

    has_edge :client_objects do |edge|
      edge.get 'BusinessObject' do |api|
        api.has_param :type, { enum: -> { BusinessObject::TYPE }}
        api.has_param :owner_biz_id, 'string'
      end
    end

    has_edge :client_page_requests do |edge|
      edge.get 'BusinessPageRequest'
    end

    has_edge :client_pages do |edge|
      edge.get 'Page'
      edge.post 'Business' do |api|
        api.has_param :page_id, 'int'
        api.has_param :permitted_tasks, { list: { enum: -> { Business::PERMITTED_TASKS }} }
      end
    end

    has_edge :client_pixels do |edge|
      edge.get 'AdsPixel'
    end

    has_edge :client_product_catalogs do |edge|
      edge.get 'ProductCatalog'
    end

    has_edge :client_publisher_block_lists do |edge|
      edge.get 'PublisherBlockList'
    end

    has_edge :clients do |edge|
      edge.delete do |api|
        api.has_param :business, 'string'
      end
    end

    has_edge :commerce_tos_acceptance do |edge|
      edge.get 'CommerceMerchantTosAcceptance'
    end

    has_edge :customconversions do |edge|
      edge.get 'CustomConversion'
      edge.post 'CustomConversion' do |api|
        api.has_param :name, 'string'
        api.has_param :description, 'string'
        api.has_param :event_source_id, 'string'
        api.has_param :rule, 'string'
        api.has_param :default_conversion_value, 'double'
        api.has_param :custom_event_type, { enum: -> { CustomConversion::CUSTOM_EVENT_TYPE }}
        api.has_param :advanced_rule, 'string'
      end
    end

    has_edge :deal_shows_pages do |edge|
      edge.get 'Page'
    end

    has_edge :direct_deal_available_advertisers do |edge|
      edge.get 'DirectDealAvailableAdvertisers'
    end

    has_edge :direct_deals do |edge|
      edge.get 'DirectDeal' do |api|
        api.has_param :status, { enum: -> { DirectDeal::STATUS }}
      end
    end

    has_edge :direct_debits do |edge|
      edge.get 'DirectDebit'
    end

    has_edge :event_source_groups do |edge|
      edge.get 'EventSourceGroup'
      edge.post 'EventSourceGroup' do |api|
        api.has_param :event_sources, { list: 'string' }
        api.has_param :name, 'string'
      end
    end

    has_edge :extendedcreditapplications do |edge|
      edge.get 'ExtendedCreditApplication'
    end

    has_edge :extendedcredits do |edge|
      edge.get 'ExtendedCredit'
    end

    has_edge :finance_permissions do |edge|
      edge.get 'FinanceObject' do |api|
        api.has_param :user, 'int'
      end
    end

    has_edge :grp_plans do |edge|
      edge.get 'ReachFrequencyPrediction' do |api|
        api.has_param :status, { enum: -> { ReachFrequencyPrediction::STATUS }}
      end
    end

    has_edge :initiated_audience_sharing_requests do |edge|
      edge.get 'BusinessAssetSharingAgreement' do |api|
        api.has_param :recipient_id, 'string'
        api.has_param :request_status, { enum: -> { BusinessAssetSharingAgreement::REQUEST_STATUS }}
      end
    end

    has_edge :initiated_sharing_agreements do |edge|
      edge.get 'BusinessAgreement' do |api|
        api.has_param :receiving_business_id, 'string'
        api.has_param :request_status, { enum: -> { BusinessAgreement::REQUEST_STATUS }}
      end
    end

    has_edge :instagram_accounts do |edge|
      edge.delete do |api|
        api.has_param :instagram_account, 'string'
      end
      edge.get 'InstagramUser'
    end

    has_edge :ip_permissions do |edge|
      edge.get 'IpObject' do |api|
        api.has_param :user, 'int'
      end
    end

    has_edge :matched_search_applications do |edge|
      edge.get 'BusinessMatchedSearchApplicationsEdgeData' do |api|
        api.has_param :app_store, { enum: -> { BusinessMatchedSearchApplicationsEdgeData::APP_STORE }}
        api.has_param :app_store_country, 'string'
        api.has_param :query_term, 'string'
        api.has_param :allow_incomplete_app, 'bool'
      end
    end

    has_edge :measurement_playground do |edge|
      edge.get 'MeasurementPlayground'
    end

    has_edge :measurement_reports do |edge|
      edge.get 'MeasurementReport' do |api|
        api.has_param :report_type, { enum: -> { MeasurementReport::REPORT_TYPE }}
        api.has_param :filters, { list: 'object' }
      end
      edge.post 'MeasurementReport' do |api|
        api.has_param :report_type, { enum: -> { MeasurementReport::REPORT_TYPE }}
        api.has_param :metadata, 'string'
      end
    end

    has_edge :mhub_terms_of_service do |edge|
      edge.get 'MHubTermsOfService'
    end

    has_edge :offline_conversion_data_sets do |edge|
      edge.get 'OfflineConversionDataSet'
      edge.post 'OfflineConversionDataSet' do |api|
        api.has_param :name, 'string'
        api.has_param :description, 'string'
        api.has_param :data_origin, { enum: -> { OfflineConversionDataSet::DATA_ORIGIN }}
        api.has_param :enable_auto_assign_to_accounts, 'bool'
        api.has_param :auto_assign_to_new_accounts_only, 'bool'
      end
    end

    has_edge :offline_terms_of_service do |edge|
      edge.get 'OfflineTermsOfService'
    end

    has_edge :order_id_attributions do |edge|
      edge.get 'OrderIdAttributions' do |api|
        api.has_param :pixel_id, 'string'
        api.has_param :app_id, 'string'
        api.has_param :dataset_id, 'string'
        api.has_param :since, 'int'
        api.has_param :until, 'int'
        api.has_param :simple_attribution, 'bool'
      end
    end

    has_edge :owned_ad_account_requests do |edge|
      edge.get 'LegacyBusinessAdAccountRequest'
    end

    has_edge :owned_ad_accounts do |edge|
      edge.get 'AdAccount'
      edge.post 'Business' do |api|
        api.has_param :adaccount_id, 'string'
      end
    end

    has_edge :owned_apps do |edge|
      edge.get 'Application'
      edge.post 'Business' do |api|
        api.has_param :app_id, 'object'
      end
    end

    has_edge :owned_businesses do |edge|
      edge.delete do |api|
        api.has_param :client_id, 'object'
      end
      edge.get 'Business' do |api|
        api.has_param :client_user_id, 'object'
      end
      edge.post 'Business' do |api|
        api.has_param :name, 'string'
        api.has_param :vertical, { enum: -> { Business::VERTICAL }}
        api.has_param :timezone_id, 'int'
        api.has_param :survey_business_type, { enum: -> { Business::SURVEY_BUSINESS_TYPE }}
        api.has_param :survey_num_people, 'int'
        api.has_param :survey_num_assets, 'int'
        api.has_param :sales_rep_email, 'string'
        api.has_param :shared_page_id, 'object'
        api.has_param :page_permitted_roles, { list: { enum: -> { Business::PAGE_PERMITTED_ROLES }} }
      end
    end

    has_edge :owned_custom_conversions do |edge|
      edge.get 'CustomConversion'
    end

    has_edge :owned_domains do |edge|
      edge.get 'OwnedDomain'
      edge.post 'OwnedDomain' do |api|
        api.has_param :domain_name, 'string'
      end
    end

    has_edge :owned_instagram_accounts do |edge|
      edge.get 'InstagramUser'
    end

    has_edge :owned_objects do |edge|
      edge.get 'BusinessObject' do |api|
        api.has_param :type, { enum: -> { BusinessObject::TYPE }}
      end
    end

    has_edge :owned_page_requests do |edge|
      edge.get 'BusinessPageRequest'
    end

    has_edge :owned_pages do |edge|
      edge.get 'Page'
      edge.post 'Business' do |api|
        api.has_param :page_id, 'int'
        api.has_param :ig_password, 'string'
      end
    end

    has_edge :owned_pixels do |edge|
      edge.get 'AdsPixel'
    end

    has_edge :owned_product_catalogs do |edge|
      edge.get 'ProductCatalog'
      edge.post 'ProductCatalog' do |api|
        api.has_param :name, 'string'
        api.has_param :vertical, { enum: -> { ProductCatalog::VERTICAL }}
        api.has_param :flight_catalog_settings, 'hash'
        api.has_param :destination_catalog_settings, 'hash'
        api.has_param :da_display_settings, 'object'
      end
    end

    has_edge :owned_publisher_block_lists do |edge|
      edge.get 'PublisherBlockList'
    end

    has_edge :pages do |edge|
      edge.delete do |api|
        api.has_param :page_id, 'int'
      end
      edge.post 'Business' do |api|
        api.has_param :page_id, 'int'
        api.has_param :access_type, { enum: -> { Business::ACCESS_TYPE }}
        api.has_param :permitted_roles, { list: { enum: -> { Business::PERMITTED_ROLES }} }
      end
    end

    has_edge :partner_integrations do |edge|
      edge.get 'PartnerIntegrationLinked'
      edge.post 'PartnerIntegrationLinked' do |api|
        api.has_param :external_id, 'string'
        api.has_param :gtm_account_id, 'string'
        api.has_param :gtm_container_id, 'string'
        api.has_param :name, 'string'
        api.has_param :partner, { enum: -> { PartnerIntegrationLinked::PARTNER }}
      end
    end

    has_edge :partneradaccount do |edge|
      edge.post do |api|
        api.has_param :name, 'string'
        api.has_param :currency, 'string'
        api.has_param :timezone_id, 'int'
        api.has_param :end_advertiser, 'object'
        api.has_param :funding_id, 'string'
        api.has_param :media_agency, 'string'
        api.has_param :partner, 'string'
        api.has_param :invoice, 'bool'
        api.has_param :po_number, 'string'
        api.has_param :io, 'bool'
        api.has_param :billing_address_id, 'object'
        api.has_param :sold_to_address_id, 'object'
        api.has_param :liable_address_id, 'object'
        api.has_param :invoice_group_id, 'object'
      end
    end

    has_edge :partners do |edge|
      edge.get 'Business'
    end

    has_edge :pending_client_ad_accounts do |edge|
      edge.get 'BusinessAdAccountRequest'
    end

    has_edge :pending_client_apps do |edge|
      edge.get 'BusinessApplicationRequest'
    end

    has_edge :pending_client_pages do |edge|
      edge.get 'BusinessPageRequest'
    end

    has_edge :pending_owned_ad_accounts do |edge|
      edge.get 'LegacyBusinessAdAccountRequest'
    end

    has_edge :pending_owned_pages do |edge|
      edge.get 'BusinessPageRequest'
    end

    has_edge :pending_shared_pixels do |edge|
      edge.get 'AdsPixel'
    end

    has_edge :pending_users do |edge|
      edge.get 'BusinessRoleRequest' do |api|
        api.has_param :email, 'string'
      end
    end

    has_edge :picture do |edge|
      edge.get 'ProfilePictureSource' do |api|
        api.has_param :height, 'int'
        api.has_param :width, 'int'
        api.has_param :type, { enum: -> { ProfilePictureSource::TYPE }}
        api.has_param :redirect, 'bool'
      end
    end

    has_edge :pixel_tos do |edge|
      edge.get 'BusinessPixelTos'
    end

    has_edge :product_catalog_tos do |edge|
      edge.get 'BusinessProductCatalogTos'
    end

    has_edge :product_catalogs do |edge|
      edge.get 'ProductCatalog'
      edge.post 'ProductCatalog' do |api|
        api.has_param :name, 'string'
        api.has_param :vertical, { enum: -> { ProductCatalog::VERTICAL }}
        api.has_param :flight_catalog_settings, 'hash'
        api.has_param :destination_catalog_settings, 'hash'
        api.has_param :da_display_settings, 'object'
      end
    end

    has_edge :publisher_block_lists do |edge|
      edge.get 'PublisherBlockList'
    end

    has_edge :received_audience_permissions do |edge|
      edge.get 'AudiencePermission' do |api|
        api.has_param :partner_id, 'string'
      end
    end

    has_edge :received_audience_sharing_requests do |edge|
      edge.get 'BusinessAssetSharingAgreement' do |api|
        api.has_param :initiator_id, 'string'
        api.has_param :request_status, { enum: -> { BusinessAssetSharingAgreement::REQUEST_STATUS }}
      end
    end

    has_edge :received_inprogress_onbehalf_requests do |edge|
      edge.get 'BusinessOwnedObjectOnBehalfOfRequest'
    end

    has_edge :received_requests do |edge|
      edge.get 'BusinessRequest'
    end

    has_edge :received_sharing_agreements do |edge|
      edge.get 'BusinessAgreement' do |api|
        api.has_param :requesting_business_id, 'string'
        api.has_param :request_status, { enum: -> { BusinessAgreement::REQUEST_STATUS }}
      end
    end

    has_edge :sent_inprogress_onbehalf_requests do |edge|
      edge.get 'BusinessOwnedObjectOnBehalfOfRequest'
    end

    has_edge :sent_requests do |edge|
      edge.get 'BusinessRequest' do |api|
        api.has_param :object_type, { enum: -> { BusinessRequest::OBJECT_TYPE }}
      end
    end

    has_edge :shared_audience_permissions do |edge|
      edge.get 'AudiencePermission' do |api|
        api.has_param :partner_id, 'string'
      end
    end

    has_edge :shared_objects do |edge|
      edge.get 'BusinessObject' do |api|
        api.has_param :type, { enum: -> { BusinessObject::TYPE }}
        api.has_param :partner_id, 'string'
      end
    end

    has_edge :simple_attribution_webhook do |edge|
      edge.get 'SimpleAttributionWebhook'
    end

    has_edge :spaco_dataset_collections do |edge|
      edge.get 'SpacoDsDataCollection'
      edge.post 'SpacoDsDataCollection' do |api|
        api.has_param :spaco_data_collections, { list: 'object' }
      end
    end

    has_edge :system_users do |edge|
      edge.get 'SystemUser'
      edge.post 'SystemUser' do |api|
        api.has_param :role, { enum: -> { SystemUser::ROLE }}
        api.has_param :name, 'string'
        api.has_param :system_user_id, 'int'
      end
    end

    has_edge :tags do |edge|
      edge.get 'BusinessTag' do |api|
        api.has_param :order, { enum: -> { BusinessTag::ORDER }}
      end
    end

    has_edge :user_invitations do |edge|
      edge.delete do |api|
        api.has_param :email, 'string'
      end
      edge.get 'BusinessRoleRequest' do |api|
        api.has_param :status, { enum: -> { BusinessRoleRequest::STATUS }}
        api.has_param :email, 'string'
      end
    end

    has_edge :userpermissions do |edge|
      edge.delete do |api|
        api.has_param :user, 'int'
        api.has_param :email, 'string'
      end
      edge.post 'Business' do |api|
        api.has_param :user, 'int'
        api.has_param :email, 'string'
        api.has_param :role, { enum: -> { Business::ROLE }}
      end
    end

    has_edge :video_metrics_report do |edge|
      edge.get 'VideoMetricsReport' do |api|
        api.has_param :start_date, 'object'
        api.has_param :end_date, 'object'
        api.has_param :upload_date, 'object'
        api.has_param :platform, { enum: -> { VideoMetricsReport::PLATFORM }}
        api.has_param :type, { enum: -> { VideoMetricsReport::TYPE }}
      end
    end

    has_edge :whatsapp_business_accounts do |edge|
      edge.get 'WhatsAppBusinessAccount'
    end

  end
end
