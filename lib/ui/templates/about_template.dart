import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../assets/assets.dart';
import '../theme/theme.dart';

class AboutTemplate extends StatelessWidget {
  const AboutTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 2,
        title: const Text('Sobre', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewPaddingOf(context).bottom + 20,
          left: 32,
          right: 32,
        ),
        child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(AppColors.primary),
            backgroundColor: MaterialStateProperty.all<Color>(AppColors.backgroundColorCard),
          ),
          onPressed: () =>
              launchUrl(Uri.parse('https://intercampi.blogspot.com/2019/04/privacy-policy-intercampi-app.html?m=1')),
          child: const Text("Termos de privacidade"),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image(image: AssetImage(AppImagePath.logoLandscape), width: 250)),
            const SizedBox(height: 24),
            const Text(
              'Intercampi é o aplicativo que tem por objetivo facilitar o acesso a todos os horários dos ônibus de intercampi que circulam entre os câmpus da UNILAB \n\n'
              'Ele combina todas as listas de horários de saída dos ônibus de form simples e direta, com rotas ajustáveis remotamente e atualizações automática, permitindo o controle total de suas viágens',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 52),
            const Text(
              'Desenvolvido por:',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Edeson Bizerril',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () => launchUrl(Uri.parse('https://www.linkedin.com/in/edeson-bizerril/')),
              child: Column(
                children: [
                  const Text(
                    'Conecte-se comigo:',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Image(
                      image: AssetImage(AppImagePath.linkedinIcon),
                      width: 90,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => launchUrl(Uri.parse('https://github.com/EdesonABizerril/intercampi_unilab')),
              child: Column(
                children: [
                  const Text(
                    'Projeto open-source:',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Center(
                    child: Image(
                      image: AssetImage(AppImagePath.githubIcon),
                      width: 100,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
