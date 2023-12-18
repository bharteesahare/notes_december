def download_csv
    return root_path unless current_user.role == 'accountant'
      headers = [
    '顧客コード', #A
    '会社名', #B
    '役職', #C
    '代表者名',#D
    '決算月',#E
    'Eメール',#F
    '郵便番号',#G
    '本社住所',#H
    '電話番号',#I
    'ファックス番号',#J
    '税務発生月', #K
    '税務最終顧問料発生月',#L
    '税務営業オフィス',#M
    '税務営業担当者',#N
    '税務担当オフィス',#O
    '税務担当者',#P
    '税務顧問料',#Q
    '税務記帳料',#R
    '決算料',#S
    '年末調整料',#T
    '精算金',#U
    'キャンペーン金額',#V
    'NSS',#W
    'NSS契約開始月',#X
    '契約内容',#'紹介元オフィス',#Y
    '紹介元オフィス',#Z
    '紹介元担当',#AA
    '紹介元関与先',#AB
    '顧客情報変更履歴申請者',#AC
    '顧客情報変更履歴項目',#AD
    '顧客情報変更履歴変更前',#AE
    '顧客情報変更履歴変更後',#AF
    '顧客情報変更履歴発生月',#AG

    '税申請者',#AH #full_name
    '税項目',#AI #item
    '税変更前',#AJ #before_changes
    '税変更後',#AK #after_changes
    '税発生月',#AL #chnages_month
    '税理由',#AM #request_month
    '労務発生月',#AN
    '労務最終顧問料発生月',#AO
    '労務営業オフィス',#AP
    '労務営業担当者',#AQ
    '労務担当オフィス',#AR
    '労務担当者',#AS
    '労務顧問料',#AT
    '労務記帳料',#AU
    '社会保険新規適用手続',#AV
    '労働保険新規成立手続',#AW
    'キャンペン項目', #AX
    'キャンペーン金額', #AY
    'NSS',#AZ
    'NSS契約開始月',#BA
    '契約内容', #BB
    '紹介元オフィス', #BC
    '紹介元担当', #BD
    '紹介元関与先', #BE
    '労申請者', #BF #full_name
    '労項目',#BG #item
    '労変更前', #BH #before_changes
    '労変更後', #BI #after_changes
    '労発生月',#BJ #chnages_month
    '労理由', #BK #request_month
    ]

    sql = "SELECT  clients.client_cd, clients.company_nm, clients.manage_pos, clients.closing_month, clients.email, clients.postal_cd, clients.head_ofc_add, clients.telephone_no, clients.fax_no, contracts.type,
    clients.representative_nm, contracts.end_date, contracts.start_date, contracts.end_date, contracts.end_date,
    sales_ofc.name sales_ofc_name, concat(sales_person.last_name,sales_person.first_name) sales_person_name,
    office.name office_name, concat(person.last_name,person.first_name) person_name,
    contracts.advisory_fee, contracts.salary_calc, contracts.social_insurance, contracts.labor_insurance, contracts.nss,
    contracts.enroll_fee, contracts.settlement_fee, contracts.year_end_adj_fee, contracts.liquidation_money, contracts.campaign,
    contracts.nss_start_date, contracts.reference_by, contracts.referral_office, contracts.referrer_user, contracts.referrer_involver,ARRAY(
    SELECT audits.id FROM audits WHERE audits.auditable_id = contracts.id
    AND audits.auditable_type = 'Contract') AS audit_ids,
    ARRAY(
    SELECT audits.id FROM audits WHERE audits.auditable_id = clients.id AND audits.auditable_type = 'Client' ) AS audit_client_ids
    FROM clients "
    sql += "LEFT JOIN contracts ON contracts.client_id = clients.id "
    sql += "LEFT JOIN audits A1 ON contracts.id = A1.auditable_id AND A1.auditable_type = 'Contract'"
    sql += "LEFT JOIN audits A2 ON clients.id = A2.auditable_id AND A2.auditable_type = 'Client'"
    sql += "LEFT JOIN offices sales_ofc ON sales_ofc.id = contracts.sales_ofc_id "
    sql += "LEFT JOIN  offices office ON office.id = contracts.ofc_id "
    sql += "LEFT JOIN users sales_person ON sales_person.id = contracts.sales_person_id "
    sql += "LEFT JOIN users person ON person.id = contracts.person_id "
    sql += "WHERE  contracts.status='accepted' OR contracts.status='completed' "
    sql += "GROUP BY clients.client_cd, contracts.type, clients.company_nm, clients.manage_pos, clients.closing_month, clients.email, clients.postal_cd, clients.head_ofc_add, clients.telephone_no, clients.fax_no,
    clients.representative_nm, contracts.end_date, contracts.start_date, contracts.end_date, contracts.end_date,
    sales_ofc.name, sales_person.last_name, sales_person.first_name,
    office.name, sales_person.last_name, sales_person.first_name, contracts.advisory_fee, contracts.salary_calc,
    contracts.social_insurance, contracts.labor_insurance, contracts.enroll_fee, contracts.settlement_fee,
    contracts.year_end_adj_fee, contracts.liquidation_money, contracts.campaign, contracts.nss_start_date,
    contracts.reference_by, contracts.referral_office, contracts.referrer_user, contracts.referrer_involver,contracts.nss,
    person.last_name, person.first_name, contracts.id, clients.id
    ORDER BY clients.client_cd DESC "
    records = ActiveRecord::Base.connection.execute(sql).as_json
    records = records.group_by{|r| r['client_cd']}
    csv_data = CSV.generate() do |csv|
      csv << headers
      records.each do |resources| 
        tax = {}
        labor = {}
        csv_fields = {}
        resources[1].each do |resource|
          tax   = resource if resource['type'] == "Tax"
          labor = resource if resource['type'] == "Labor"
          csv_fields = {client_cd: resource['client_cd'], company_nm: resource['company_nm'], director: resource['manage_pos'],
          closing_month:  resource['closing_month'], full_name: resource['representative_nm'], email: resource['email'], postal_cd: resource['postal_cd'], head_ofc_add: resource['head_ofc_add'], telephone_no: resource['telephone_no'],  fax_no: resource['fax_no']  }
        end

        tax_and_labor_details = get_tax_and_labor_details(tax,labor)  
          csv_fields.merge!(tax_and_labor_details)
          ###if csv_fields[:client_cd] == '3873'
          csv << [
            csv_fields[:client_cd],#A
            csv_fields[:company_nm],#B
            csv_fields[:director],#C
            csv_fields[:full_name],#D
            csv_fields[:closing_month],#E
            csv_fields[:email],#F
            csv_fields[:postal_cd],#G
            csv_fields[:head_ofc_add],#H
            csv_fields[:telephone_no],#I
            csv_fields[:fax_no],#J
            csv_fields[:tax_start_date],#K
            csv_fields[:tax_month_of_final_tax_advisery_fee],#L
            csv_fields[:tax_sales_office],#M
            csv_fields[:tax_sales_person],#N
            csv_fields[:tax_office],#O
            csv_fields[:tax_person],#P
            csv_fields[:tax_advisory_fee],#Q
            csv_fields[:tax_book_keeping_fee],#R
            csv_fields[:tax_settlement_fee].to_i,#S
            csv_fields[:tax_year_end_adj_fee].to_i,#T
            csv_fields[:tax_liquidation_money],#U
            csv_fields[:tax_campaign], #V
            csv_fields[:tax_nss],#W
            csv_fields[:tax_nss_start_date], #X
            csv_fields[:tax_refer_as], #Y
            csv_fields[:tax_referal_ofc],#Z
            csv_fields[:tax_refer_user], #AA
            csv_fields[:tax_refer_involver], #AB

            csv_fields[:tax_user_full_name_history],
            csv_fields[:tax_item_history],
            csv_fields[:tax_before_change_history],
            csv_fields[:tax_after_change_history],
            csv_fields[:tax_created_at_histroy],

            csv_fields[:tax_user_full_name], #full_name
            csv_fields[:tax_item],
            csv_fields[:tax_before_change],
            csv_fields[:tax_after_change],
            csv_fields[:tax_request_reason],
            csv_fields[:tax_change_month],

            csv_fields[:labor_start_date], #AC
            csv_fields[:labor_month_of_final_tax_advisery_fee],#AD
            csv_fields[:labor_sales_office],#AE
            csv_fields[:labor_sales_person],#AF
            csv_fields[:labor_office],#AG
            csv_fields[:labor_person],#AH
            csv_fields[:labor_advisery_fee],#AI
            csv_fields[:labor_book_keeping_fee],#AJ
            csv_fields[:labor_social_insurance],#AK
            csv_fields[:labor_labor_insurance],#AL
            csv_fields[:labor_campaign_label], #AM
            csv_fields[:labor_campaign_amount],#AN
            csv_fields[:labor_nss], #AO
            csv_fields[:labor_nss_start_date],#AP
            csv_fields[:labor_refer_as],#AQ
            csv_fields[:labor_referral_office], #AR
            csv_fields[:labor_referrer_user],#AS
            csv_fields[:labor_referrer_involver], #AT
            csv_fields[:labor_user_full_name], #full_name
            csv_fields[:labor_item],
            csv_fields[:labor_before_change],
            csv_fields[:labor_after_change],
            csv_fields[:labor_request_reason],
            csv_fields[:labor_change_month],
          ]
      end
    end
    respond_to do |format|
      format.html do
        send_data csv_data.encode(Encoding::SJIS,invalid: :replace, undef: :replace), filename: "顧客基本情報の確認_#{Date.today}.csv"
      end
    end 
  end



  def get_tax_and_labor_details(tax,labor)
    tax_start_date = '' #税務発生月
    tax_sales_office = ''
    tax_sales_person = ''
    tax_office = ''
    tax_person = ''
    tax_advisory_fee = ''
    tax_book_keeping_fee = ''
    tax_settlement_fee = ''
    tax_year_end_adj_fee = ''
    tax_liquidation_money = ''
    tax_campaign = ''
    tax_nss = '' #税務NSS
    nss_start_date = ''
    tax_month_of_final_tax_advisery_fee = '' #税務最終顧問料発生月 # ------------need to confirm ----------------
    tax_refer_as = ''
    tax_referal_ofc = '' #紹介元オフィス
    tax_refer_user = '' #紹介元担当
    tax_refer_involver = '' #紹介元関与先
    tax_nss_start_date = '' #NSS契約開始月
    # customer history
    tax_user_full_name_history = ''
    tax_item_history = ''
    tax_before_change_history = ''
    tax_after_change_history = ''
    tax_created_at_histroy = ''
    #tax history
    tax_user_full_name = ''
    tax_item = ''
    tax_before_change = ''
    tax_after_change = ''
    tax_request_reason = ''
    tax_change_month = ''
    #labor details
    labor_start_date = '' #労務発生月
    labor_month_of_final_tax_advisery_fee = '' #労務最終顧問料発生月
    labor_sales_office = '' #労務営業オフィス
    labor_sales_person = '' #労務営業担当者
    labor_office = '' #労務担当オフィス
    labor_person = '' #労務担当者
    labor_advisery_fee = '' #労務顧問料
    labor_book_keeping_fee = '' #労務記帳料
    labor_social_insurance = '' #社会保険新規適用手続
    labor_labor_insurance = '' #労働保険新規成立手続
    labor_campaign_label = '' # キャンペン項目
    labor_campaign_amount = '' # キャンペーン金額
    labor_nss = '' #労務NSS
    labor_nss_start_date = '' #NSS契約開始月
    labor_refer_as = '' #契約内容
    labor_referral_office = '' #紹介元オフィス
    labor_referrer_user = '' #紹介元担当
    labor_referrer_involver = '' #紹介元関与先
    #labor history
    labor_user_full_name = ''
    labor_item = ''
    labor_before_change = ''
    labor_after_change = ''
    labor_request_reason = ''
    labor_change_month = ''

    default_nss = ['nss_not_completed','nss_completed']
    if labor.present?
      labor_month_of_final_tax_advisery_fee =  labor['end_date']&.to_date&.strftime("%Y年%m月") if labor['end_date'].present?
      labor_start_date = labor['start_date'].to_date&.strftime("%Y年%m月")
      labor_sales_office = labor['sales_ofc_name']
      labor_sales_person = labor['sales_person_name']
      labor_office = labor['office_name']
      labor_person = labor['person_name']
      labor_advisery_fee = labor['advisory_fee']
      labor_book_keeping_fee = labor['salary_calc'].to_i
      labor_social_insurance = labor['social_insurance'].to_i
      labor_labor_insurance = labor['labor_insurance'].to_i
      labor_campaign_label = labor['campaign_label']
      labor_campaign_amount = labor['campaign']
      labor_nss = Contract.human_enum_name(:nss, default_nss[labor['nss']]) if labor['nss'].present?
      labor_nss_start_date = labor['nss_start_date']&.to_date&.strftime('%Y年%m月')
      Contract.reference_bies.values.each do |refer_as|
        key = Contract.reference_bies.select{|k,v| v == refer_as}.keys.last if refer_as == labor['reference_by']
        labor_refer_as = Client.human_enum_name(:reference_by, key) if refer_as == labor['reference_by']
      end
      if labor['reference_by'] == 1
        labor_referral_office = labor['referral_office']
        labor_referrer_user = labor['referrer_user']
        labor_referrer_involver = labor['referrer_involver']
      end
      if labor["audit_ids"].present?
        audit = Audited::Audit. (:user).find(labor['audit_ids'].gsub(/[{}]/, '').split(',').map(&:to_i))
        labor_user_full_name = []
        labor_item = []
        labor_before_change = []
        labor_after_change = []
        labor_change_month = []
        labor_request_reason = []

        audit.each do |audit|
          data_full_name = audit_requested_user(audit).split(' ').reverse.join(' ')
          audit.audited_changes&.each do |key, value|
            if value.kind_of?(Array) && !value[0].blank? || value.kind_of?(Array) && value[0].blank? && !value[1].blank? || !value.kind_of?(Array) && !value.to_s.blank?
             next if key == 'status' || key == "changed_month" || key == 'request_uid'
             next if audit.audited_changes['request_reason'].present? && audit.audited_changes['request_reason'][1] == value[1].to_s && key == 'request_reason'
              labor_user_full_name << (data_full_name)
              labor_item << t("contract.#{key}")
              if key == 'reference_by'
                elsif key == 'nss'
                elsif key == 'client_id'
              else
                labor_before_change << (key == 'person_id' || key == 'sales_person_id' ? begin User.with_deleted.find(value[0]).full_name rescue ActiveRecord::RecordNotFound end : key == 'ofc_id' || key == 'sales_ofc_id' ? Office.with_deleted.find(value[0]).name : number_with_delimiter(value[0]) || "-")
              end
              if key == 'reference_by'
                elsif key == 'nss'
                elsif key == 'client_id'
              else
                labor_after_change << (key == 'person_id' || key == 'sales_person_id' ? begin User.with_deleted.find(value[1]).full_name rescue ActiveRecord::RecordNotFound end  :  key == 'ofc_id' || key == 'sales_ofc_id' ? Office.with_deleted.find(value[1])&.name :  number_with_delimiter(value[1])  || "-")
               end
              if audit.audited_changes['changed_month'].present?
                labor_change_month << audit.audited_changes['changed_month'][1].strftime('%Y/%m')
              else
                labor_change_month << audit.created_at.strftime("%Y/%m ")
              end
              if audit.audited_changes['request_reason'].present?
                labor_request_reason << audit.audited_changes['request_reason'][1]
              else
               labor_request_reason <<  "-"
              end
            end
          end
        end
      end
    end

    if tax.present?
      tax_month_of_final_tax_advisery_fee = tax['end_date']&.to_date&.strftime("%Y年%m月") if tax['end_date'].present? ## doubt field
      tax_start_date = tax['start_date']&.to_date&.strftime("%Y年%m月")
      tax_sales_office = tax['sales_ofc_name']
      tax_sales_person = tax['sales_person_name']
      tax_office = tax['office_name']
      tax_person = tax['person_name']
      tax_advisory_fee = tax['advisory_fee']
      tax_book_keeping_fee = tax['enroll_fee']
      tax_settlement_fee = tax['settlement_fee']
      tax_year_end_adj_fee = tax['year_end_adj_fee']
      tax_liquidation_money = tax['liquidation_money']
      tax_campaign = tax['campaign']
      #binding.pry if tax['nss'].present? && tax['nss'] != 0
      tax_nss = Contract.human_enum_name(:nss, default_nss[tax['nss']]) if tax['nss'].present?
      tax_nss_start_date = tax['nss_start_date']&.to_date&.strftime('%Y年%m月')
      Contract.reference_bies.values.each do |refer_as|
        key = Contract.reference_bies.select{|k,v| v == refer_as}.keys.last if refer_as == tax['reference_by']
        tax_refer_as = Client.human_enum_name(:reference_by, key) if refer_as == tax['reference_by']
      end
      if tax['reference_by'] == 1
        tax_referal_ofc = tax['referral_office']
        tax_refer_user = tax['referrer_user']
        tax_refer_involver = tax['referrer_involver']
      end
      #client history
      # if tax["audit_client_ids"].present?
      #   audited_ids = tax['audit_client_ids'].gsub(/[{}]/, '').split(',')
      #   array_of_numbers = audited_ids.map(&:to_i)
      #   audit = Audited::Audit.find(array_of_numbers)
      #   tax_user_full_name_history =[]
      #   tax_item_history =[]
      #   tax_before_change_history =[]
      #   tax_after_change_history =[]
      #   tax_created_at_histroy =[]
      #   audit.each do |audit|
      #     data_full_name = data_full_name
      #     audit.audited_changes&.each do |key, value|
      #       if value.kind_of?(Array) && !value[0].blank? || value.kind_of?(Array) && value[0].blank? && !value[1].blank? || !value.kind_of?(Array) && !value.to_s.blank?
      #         if value.kind_of?(Array) && !value[0].blank?
      #          tax_user_full_name_history <<  audit_requested_user(audit).split(' ').reverse.join(' ')
      #          tax_item_history <<  t("client.#{key}")
      #          tax_before_change_history << value[0] || "-"
      #          tax_after_change_history <<  value[1] || "-"
      #          tax_created_at_histroy <<  audit.created_at.strftime("%Y/%m/%d")
      #         end
      #       end
      #     end
      #   end
      # end
      if tax["audit_ids"].present?
        audit = Audited::Audit.includes(:user).find(tax['audit_ids'].gsub(/[{}]/, '').split(',').map(&:to_i))

        tax_user_full_name = []
        tax_item = []
        tax_before_change = []
        tax_after_change = []
        tax_change_month = []
        tax_request_reason = []

        audit.each do |audit|
          data_full_name = audit_requested_user(audit).split(' ').reverse.join(' ')
          audit.audited_changes&.each do |key, value|
            if value.kind_of?(Array) && !value[0].blank? || value.kind_of?(Array) && value[0].blank? && !value[1].blank? || !value.kind_of?(Array) && !value.to_s.blank?
             next if key == 'status' || key == "changed_month" || key == 'request_uid'
             next if audit.audited_changes['request_reason'].present? && audit.audited_changes['request_reason'][1] == value[1].to_s && key == 'request_reason'
              tax_user_full_name << (data_full_name)
              tax_item << t("contract.#{key}")
              if key == 'reference_by'
                elsif key == 'nss'
                elsif key == 'client_id'
              else
                tax_before_change << (key == 'person_id' || key == 'sales_person_id' ? begin User.with_deleted.find(value[0]).full_name rescue ActiveRecord::RecordNotFound end : key == 'ofc_id' || key == 'sales_ofc_id' ? Office.with_deleted.find(value[0]).name : number_with_delimiter(value[0]) || "-")
              end
              if key == 'reference_by'
                elsif key == 'nss'
                elsif key == 'client_id'
              else
                tax_after_change << (key == 'person_id' || key == 'sales_person_id' ? begin User.with_deleted.find(value[1]).full_name rescue ActiveRecord::RecordNotFound end  :  key == 'ofc_id' || key == 'sales_ofc_id' ? Office.with_deleted.find(value[1]).name :  number_with_delimiter(value[1])  || "-")
               end
              if audit.audited_changes['changed_month'].present?
                tax_change_month << audit.audited_changes['changed_month'][1].strftime('%Y/%m')
              else
                tax_change_month << audit.created_at.strftime("%Y/%m ")
              end
              if audit.audited_changes['request_reason'].present?
                tax_request_reason << audit.audited_changes['request_reason'][1]
              else
               tax_request_reason <<  "-"
              end
            end
          end
        end
      end
    end


    {
      tax_start_date:tax_start_date, tax_sales_office: tax_sales_office, tax_sales_person: tax_sales_person, tax_office: tax_office,
      tax_person: tax_person,
      tax_advisory_fee: nv(tax_advisory_fee), tax_book_keeping_fee: nv(tax_book_keeping_fee), tax_settlement_fee: nv(tax_settlement_fee),
      tax_year_end_adj_fee: nv(tax_year_end_adj_fee), tax_liquidation_money: nv(tax_liquidation_money), tax_campaign: nv(tax_campaign),
      tax_nss: tax_nss, nss_start_date: nss_start_date,tax_month_of_final_tax_advisery_fee: nv(tax_month_of_final_tax_advisery_fee),
      tax_refer_as: tax_refer_as, tax_referal_ofc: tax_referal_ofc, tax_refer_user: tax_refer_user, tax_refer_involver: tax_refer_involver,
      tax_nss_start_date: tax_nss_start_date,tax_user_full_name_history: tax_user_full_name_history,tax_item_history: tax_item_history,
      tax_before_change_history: tax_before_change_history,tax_after_change_history: tax_after_change_history,tax_created_at_histroy: tax_created_at_histroy,
      tax_user_full_name: tax_user_full_name, tax_item: tax_item,tax_before_change: tax_before_change,
      tax_after_change: tax_after_change,tax_request_reason: tax_request_reason, tax_change_month: tax_change_month,
      labor_month_of_final_tax_advisery_fee: nv(labor_month_of_final_tax_advisery_fee),
      labor_start_date: labor_start_date, labor_campaign_amount: labor_campaign_amount,
      labor_sales_office: labor_sales_office, labor_sales_person: labor_sales_person, labor_office: labor_office,
      labor_person: labor_person, labor_advisery_fee: nv(labor_advisery_fee), labor_book_keeping_fee: nv(labor_book_keeping_fee),
      labor_social_insurance: nv(labor_social_insurance), labor_labor_insurance: nv(labor_labor_insurance),
      labor_nss: labor_nss, labor_nss_start_date: labor_nss_start_date, labor_campaign_label: labor_campaign_label,
      labor_refer_as: labor_refer_as, labor_referral_office: labor_referral_office, labor_referrer_user: labor_referrer_user,
      labor_referrer_involver: labor_referrer_involver,labor_user_full_name: labor_user_full_name, labor_item: labor_item,labor_before_change: labor_before_change,
      labor_after_change: labor_after_change,labor_request_reason: labor_request_reason, labor_change_month: labor_change_month
    }

  end



  def fetch_taxes_labor
 taxes = current_company.taxes.includes(
    :tax_item,
    :tax_change_month,
    :tax_nss,
    :tax_office,
    :tax_person,
    :tax_refer_as,
    :tax_referral_office,
    :tax_referrer_user,
    :tax_referrer_involver,
    :tax_sales_office,
    :tax_sales_person,
    :tax_user_full_name,
    :tax_user_full_name_history,
    :audits => [:audited])
    .where(year: tax_year)

 labor = current_company.labors.includes(
    :labor_item,
    :labor_change_month,
    :labor_nss,
    :labor_office,
    :labor_person,
    :labor_refer_as,
    :labor_referral_office,
    :labor_referrer_user,
    :labor_referrer_involver,
    :labor_sales_office,
    :labor_sales_person,
    :labor_user_full_name,
    :audits => [:audited])
    .where(year: tax_year)

 # Remaining code remains the same
end


  def audit_requested_user(audit)
    user_ids = [audit.user_id, audit.requested_user_id]

    first_updated_user = User.where(id: user_ids).where.not(updated_at: nil).order(:updated_at).first

    if first_updated_user.nil?
      contract = Contract.find_by(id: audit.auditable_id)
      user_id = contract&.updated_user_id
      first_updated_user = User.find_by(id: user_id) || User.with_deleted.find_by(id: user_id)
    end

    "#{first_updated_user&.first_name} #{first_updated_user&.last_name}"
  end