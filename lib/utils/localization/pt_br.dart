const Map<String, String> ptBR = {
  // General
  'general.appTitle': 'Lembrete de Medicamentos',
  'general.save': 'Salvar',
  'general.cancel': 'Cancelar',
  'general.delete': 'Excluir',
  'general.edit': 'Editar',
  'general.add': 'Adicionar',
  'general.confirm': 'Confirmar',
  'general.success': 'Sucesso',
  'general.error': 'Erro',
  'general.loading': 'Carregando...',
  'general.requiredField': 'Este campo é obrigatório',
  'general.done': 'Concluído',

  // Auth
  'auth.login': 'Entrar',
  'auth.signup': 'Cadastrar',
  'auth.logout': 'Sair',
  'auth.email': 'E-mail',
  'auth.password': 'Senha',
  'auth.loginButton': 'Entrar',
  'auth.signupButton': 'Cadastrar',
  'auth.loginErrorTitle': 'Falha no login',
  'auth.signupErrorTitle': 'Falha no cadastro',
  'auth.unknownError': 'Ocorreu um erro desconhecido.',
  'auth.or': 'OU',
  'auth.noAccount': 'Não tem uma conta? Cadastre-se',
  'auth.haveAccount': 'Já tem uma conta? Entre',

  // Home / Medicine List
  'home.title': 'Meus Medicamentos',
  'home.addMedicine': 'Adicionar Novo Medicamento',
  'home.noMedicines':
      'Nenhum medicamento adicionado ainda. Toque em + para adicionar um!',
  'home.confirmDeleteTitle': 'Excluir Medicamento',
  'home.confirmDeleteContent': 'Tem certeza que deseja excluir {medicineName}?',

  // Add/Edit Medicine Page
  'addMedicine.titleAdd': 'Adicionar Medicamento',
  'addMedicine.titleEdit': 'Editar Medicamento',
  'addMedicine.nameLabel': 'Nome do Medicamento',
  'addMedicine.nameHint': 'ex: Paracetamol',
  'addMedicine.typeLabel': 'Tipo/Categoria do Medicamento',
  'addMedicine.typeHint': 'ex: Comprimido, Xarope, Injeção',
  'addMedicine.dosageLabel': 'Quantidade da Dose',
  'addMedicine.dosageHint': 'ex: 1, 2, 500',
  'addMedicine.dosageUnitLabel': 'Unidade da Dose',
  'addMedicine.dosageUnitHint': 'ex: comprimido, mL, mg',
  'addMedicine.frequencyLabel': 'Frequência',
  'addMedicine.frequencyHint': 'ex: Diário, Duas vezes ao dia',
  'addMedicine.durationLabel': 'Duração (dias)',
  'addMedicine.durationHint': 'ex: 7, 14, 30 (0 para contínuo)',
  'addMedicine.whenToTakeLabel': 'Quando Tomar / Notas',
  'addMedicine.whenToTakeHint': 'ex: Com comida, Antes de dormir',
  'addMedicine.startDateLabel': 'Data de Início',
  'addMedicine.endDateLabel': 'Data de Término (Opcional)',
  'addMedicine.selectDate': 'Selecionar Data',
  'addMedicine.selectTime': 'Selecionar Hora',
  'addMedicine.timesLabel': 'Vezes por Dia',
  'addMedicine.addTime': 'Adicionar Hora',
  'addMedicine.notesLabel': 'Notas Adicionais (Opcional)',
  'addMedicine.notesHint': 'ex: Armazenar em local fresco',
  'addMedicine.enableNotificationsLabel': 'Ativar Lembretes de Dose',
  'addMedicine.errorNumeric': 'Por favor, insira um número válido',
  'addMedicine.addMedicine': 'Adicionar Medicamento',
  'addMedicine.save': 'Salvar',
  'addMedicine.name': 'Nome do Medicamento',
  'addMedicine.addMedicineHint': 'Nome do Medicamento (ex: Paracetamol)',
  'addMedicine.dosage': 'Dosagem',
  'addMedicine.dosageHint2': 'Quantidade (ex: 500)',
  'addMedicine.dosageUnit': 'Unidade (ex: mg)',
  'addMedicine.category': 'Categoria',
  'addMedicine.frequency': 'Frequência & Duração',
  'addMedicine.selectDoseTimes': 'Selecionar Horários de Dose',
  'addMedicine.times': 'vez(es) selecionada(s)',
  'addMedicine.selectDuration': 'Selecionar Duração',
  'addMedicine.days': 'dia(s)',
  'addMedicine.whenToTake': 'Quando Tomar',
  'addMedicine.beforeFood': 'Antes da Refeição',
  'addMedicine.afterFood': 'Depois da Refeição',
  'addMedicine.notifications': 'Notificações',
  'addMedicine.enableNotifications': 'Ativar Lembretes de Dose',
  'addMedicine.receiveNotification':
      'Receba uma notificação 5 minutos antes de cada dose',
  'addMedicine.doseTimesPickerTitle': 'Selecionar Horários de Dose',
  'addMedicine.done': 'Concluído',
  'addMedicine.deleteMedicine': 'Deletar Medicamento',

  // Medicine Controller Messages
  'medicine.addSuccess': 'Medicamento adicionado com sucesso.',
  'medicine.updateSuccess': 'Medicamento atualizado com sucesso.',
  'medicine.deleteSuccess': 'Medicamento excluído com sucesso.',
  'medicine.errorNeedTime': 'Por favor, selecione pelo menos um horário.',
  'medicine.saveMedicineSuccess': 'Medicamento salvo com sucesso.',
  'medicine.saveMedicineError': 'Erro',
  'medicine.saveMedicineErrorMessage': 'Falha ao salvar medicamento: {e}',
  'medicine.updateMedicineSuccess': 'Medicamento atualizado com sucesso.',
  'medicine.updateMedicineError': 'Erro',
  'medicine.updateMedicineErrorMessage': 'Falha ao atualizar medicamento: {e}',
  'medicine.deleteMedicineSuccess': 'Medicamento excluído com sucesso.',
  'medicine.deleteMedicineError': 'Erro',
  'medicine.deleteMedicineErrorMessage': 'Falha ao excluir medicamento: {e}',
  'medicine.deleteMedicineSuccessMessage': 'Medicamento excluído com sucesso.',
  'medicine.saveMedicineSuccessMessage': 'Medicamento salvo com sucesso.',
  'medicine.withFood': 'Com Comida',

  // Settings Page
  'settings.title': 'Configurações',
  'settings.language': 'Idioma',
  'settings.selectLanguage': 'Selecionar Idioma',
  'settings.profile': 'Perfil',

  // Introduction Screen
  'introduction.skip': 'Pular',
  'introduction.done': 'Concluído',
  'introduction.next': 'Próximo',

  // Filter
  'filter.allTypes': 'Todos os Tipos',
  'filter.uncategorized': 'Sem Categoria',
  'filter.searchHint': 'Pesquisar Medicamentos...',
  'filter.noResultsForSearchAndType':
      'Nenhum resultado para \"{query}\" em {type}',
  'filter.noResultsForSearch': 'Nenhum resultado para \"{query}\"',
  'filter.noResultsForType': 'Nenhum resultado para o tipo \"{type}\"',

  // Medicine Card
  'card.treatmentCompleted': 'Tratamento Concluído',
  'card.nextDoseN_A': 'Próxima dose: N/A',
  'card.todayAt': 'Hoje às',
  'card.tomorrowAt': 'Amanhã às',
  'card.at': 'às',
  'card.nextDose': 'Próxima dose:',
  'card.frequency.onceDaily': 'Uma vez ao dia',
  'card.frequency.twiceDaily': 'Duas vezes ao dia',
  'card.frequency.thriceDaily': 'Três vezes ao dia',
  'card.frequency.timesDaily': '{count} vezes ao dia',
  'addMedicine.nameLabelText': 'Nome',
  'addMedicine.dosageLabelText': 'Dosagem',
  'addMedicine.dosageQuantityHint': 'Quantidade (ex: 500)',
  'addMedicine.categoryLabel': 'Categoria',
  'addMedicine.frequencyDurationLabel': 'Frequência & Duração',
  'addMedicine.selectDoseTimesPlaceholder': 'Selecionar Horários de Dose',
  'addMedicine.doseTimesBottomSheetTitle': 'Selecionar Horários de Dose',
  'addMedicine.timesSelectedInfo': '{count} horário(s) selecionado(s)',
  'addMedicine.selectDurationPlaceholder': 'Selecionar Duração',
  'addMedicine.durationSelectedInfo': '{count} dia(s)',
  'addMedicine.whenToTakeLabelText': 'Quando Tomar',
  'addMedicine.beforeFoodOption': 'Antes da Refeição',
  'addMedicine.afterFoodOption': 'Depois da Refeição',
  'addMedicine.notificationsSectionLabel': 'Notificações',
  'addMedicine.notificationSubtext':
      'Receba uma notificação 5 minutos antes de cada dose',
  'addMedicine.durationPickerTitle': 'Selecionar Duração (em dias)',
  'addMedicine.durationPickerItemText': '{days} dia(s)',
  'addMedicine.timesSelected': 'vezes selecionadas',
  'addMedicine.notificationsLabel': 'Notificações',
  'addMedicine.enableDoseReminders': 'Ativar Lembretes de Dose',
  'addMedicine.remindersSubtext':
      'Receba uma notificação 5 minutos antes de cada dose',

  // Profile Page
  'personal_info': 'Informações Pessoais',
  'preferences': 'Preferências',
  'about_app': 'Sobre o Aplicativo',
  'app_version': 'Versão do Aplicativo',
  'privacy_policy': 'Política de Privacidade',
  'developer': 'Desenvolvedor: Furkan Akif ISLEK',
  'noEmail': 'Nenhum e-mail encontrado',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': 'Excluir Conta',
  'profile.deleteAccountImportantText':
      'Tem certeza que deseja excluir sua conta? Esta ação não pode ser desfeita.',
  'profile.cancel': 'Cancelar',
  'profile.delete': 'Excluir',
  'profile.errorDeletingAccount': 'Erro ao excluir a conta',
  'profile.deleteAccountButton': 'Excluir Conta',

  // Profile Page
  'logout': 'Sair',
  'account': 'Conta',

  // Blog Page
  'Blog': 'Blog',
  'Bir hata oluştu.': 'Ocorreu um erro.',
  'Blog yazısı bulunamadı.': 'Nenhuma postagem de blog encontrada.',
  'Şuan blog yok': 'Nenhum blog disponível',
  'pills': 'Pílulas',
  'health': 'Saúde',
  'lifeStyle': 'Estilo de Vida',

  // Privacy Policy
  'privacy_policy_content':
      '<h3>Lembrete de Medicamentos - Política de Privacidade</h3><br><p><b>Uso de Informações Pessoais:</b><br>Nosso aplicativo está comprometido em proteger a privacidade de nossos usuários. Em nosso aplicativo de lembrete de medicamentos, coletamos informações necessárias (e-mail, informações de perfil e planos de medicação) para o acompanhamento de medicamentos e lembretes. Essas informações são usadas para fornecer e melhorar nosso serviço e não são compartilhadas com terceiros.</p><br><p><b>Armazenamento e Segurança de Dados:</b><br>Seus dados de usuário são armazenados em servidores seguros em formato criptografado. Suas informações de medicamentos e dados pessoais são protegidos por fortes medidas de segurança. Apenas o pessoal necessário pode acessar seus dados.</p><br><p><b>Direitos do Usuário:</b><br>Os usuários têm o direito de visualizar, editar ou excluir suas contas e dados a qualquer momento. Quando você exclui sua conta, todos os seus dados são removidos permanentemente de nosso sistema.</p><br><p><b>Cookies e Rastreamento:</b><br>Nosso aplicativo pode usar cookies para melhorar a experiência do usuário. Esses cookies armazenam preferências do usuário e dados de uso do aplicativo. Você pode desativar os cookies nas configurações do seu navegador, se desejar.</p><br><p><b>Notificações:</b><br>Nosso aplicativo envia notificações apenas para lembretes de medicamentos aprovados pelo usuário. Você não receberá notificações indesejadas e pode desativar as notificações na seção de configurações.</p><br><p><b>Alterações:</b><br>Nossa política de privacidade pode ser atualizada de tempos em tempos. Os usuários serão notificados quando houver alterações significativas. Ao usar nosso aplicativo, você concorda com estes termos.</p><br><p><b>Contato:</b><br>Entre em contato conosco com qualquer dúvida sobre nossa política de privacidade.</p>',

  // Introduction Page
  "introduction.page1.title":
      "Tome Seu Medicamento na Hora Certa, Mantenha Sua Saúde Segura",
  "introduction.page1.description":
      "É fácil esquecer os horários de medicação na agitação da vida. Com nosso aplicativo, você não perderá mais nenhuma dose. Configure seu medicamento, horário e duração – nós lembraremos você na hora certa.",
  "introduction.page1.tip":
      "A saúde começa com uma dose de cuidado tomada na hora certa.",

  "introduction.page2.title": "Acompanhe Sua Saúde, Mantenha-se Informado",
  "introduction.page2.description":
      "Não apenas lembramos você, mas também fornecemos informações úteis sobre sua saúde. Fortaleça seus hábitos diários de saúde com postagens de blog apoiadas por especialistas.",
  "introduction.page2.tip":
      "Uma pequena informação pode fazer uma grande diferença.",

  "introduction.page3.title": "Aberto ao Mundo, Personalizado para Você",
  "introduction.page3.description":
      "Nosso aplicativo é acessível a todos com suporte para 16 idiomas. Com sua interface fácil de usar, adicione seu medicamento com apenas alguns toques e torne sua vida mais fácil.",
  "introduction.page3.tip": "A saúde é universal, e nós também somos.",

  "introduction.back": "Voltar",
  "introduction.start": "Iniciar",

  // Register Page
  "register.register_to_medreminder_app":
      "Registre-se no aplicativo Medreminder",
  "register.already_have_an_account": "Já tem uma conta? ",
  "register.sign_in": "Entrar",
  "register.full_name": "Seu nome completo",
  "register.surname": "Seu sobrenome",
  "register.your_email": "Seu email",
  "register.type_your_password": "Digite sua senha",
  "register.re_type_your_password": "Digite sua senha novamente",
  "register.register": "Registrar",
  "register.fill_all_fields": "Por favor, preencha todos os campos",
  "register.password_not_match": "As senhas não coincidem",
  "register.error_occurred": "Ocorreu um erro",

  // Login Page
  "login.invalid_email": "Endereço de email inválido",
  "login.user_disabled": "O usuário foi desativado",
  "login.email_already_in_use": "Este endereço de email já está em uso",
  "login.wrong_password": "As informações que você digitou estão incorretas",
  "login.email_not_verified":
      "Por favor, verifique seu endereço de email primeiro",
  "login.operation_not_allowed": "Esta operação não é permitida",
  "login.error_occurred": "Ocorreu um erro",
  "login.error_occured_google": "Ocorreu um erro ao fazer login com o Google",
  "login.please_enter_your_email": "Por favor, digite seu endereço de email",
  "login.password_reset_email_sent": "Email de redefinição de senha enviado",
  "login.login_into_your_account": "Entre na sua conta",
  "login.dont_have_an_account": "Não tem uma conta? ",
  "login.sign_up": "Registre-se",
  "login.your_email": "Seu email",
  "login.type_your_password": "Digite sua senha",
  "login.login": "Entrar",
  "login.forgot_password": "Esqueceu sua senha?",
  "login.or": "ou",
  "login.login_with_google": "Entrar com o Google",

  // Menu Page
  "menu.myMedicines": "Meus Medicamentos",
  "menu.addMedicine": "Adicionar Medicamento",
  "menu.blogs": "Blog",
  "menu.profile": "Perfil",
};
