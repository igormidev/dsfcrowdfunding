import 'package:dsfcrowdfunding/src/models/crowdfunding.dart';
import 'package:dsfcrowdfunding/src/services/api_source.dart';

class CrowdFundingService {
  final ApiSource apiSource = ApiSource();

  Future<CrowdFunding> getCrowdfunding(String crowdfundingId) async {
    return CrowdFunding.fromMap(mockCrowdfunding);

    // final response = await apiSource.dio
    //     .get('https://api.dsfootball.io/v2/crowdfunding/$crowdfundingId');
    // return CrowdFunding.fromMap(response.data);
  }
}

final mockCrowdfunding = {
  'name': 'Murilo',
  'description':
      'Me ajude a conquistar minha chuteira dos sonhos! Lorem ipsum dolor '
          'sit amet, consectetur adipiscing elit, sed do eiusmod tempor '
          'incididunt ut labore et dolore magna aliqua.',
  'totalValue': 280,
  'currentValue': 107,
  'productDetail': {
    'name': 'Adidas Predator Accuracy',
    'description': 'Branca e cinza',
    'imageUrl':
        'https://m.media-amazon.com/images/I/71NwkKA-hmL._AC_UF894,1000_QL80_.jpg',
    'size': 38
  },
  'crowdFundingOwner': {
    'name': 'Murilo de Freitas Silva',
    'imageUrl':
        'https://m.media-amazon.com/images/I/71NwkKA-hmL._AC_UF894,1000_QL80_.jpg'
  },
  'contributors': [
    {
      'name': 'Tio Ricardo',
      'description': 'Boa sorte sobrinho!',
      'amountDonated': 20
    },
    {
      'name': 'José Fernando',
      'description': 'Parabéns pela iniciativa, conte comigo',
      'amountDonated': 20
    },
    {
      'name': 'Carlos Rodrigues',
      'description': 'Joga muito!',
      'amountDonated': 20
    },
    {
      'name': 'Maria Rita',
      'description': 'Sucesso murilo!',
      'amountDonated': 20
    }
  ],
  'highlights': [
    {
      'uuid': 'bb548068-c226-4310-af72-0d5b70c957e6',
      'thumb':
          'https://stream.dsfootball.io/posts/7b5515df-a65c-4f7c-8c4f-701e94c1b7c4-1694009125739/thumbnails/00001.png',
      'contentCategory': 'Game',
      'video':
          'https://stream.dsfootball.io/posts/7b5515df-a65c-4f7c-8c4f-701e94c1b7c4-1694009125739/index.m3u8',
      'postedAt': '2023-09-06T14:09:10+0000',
      'id': '27519869',
      'title': 'alguns lances',
      'numLikes': 1,
      'numComments': 1,
      'evaluation': {'composition': 0}
    },
    {
      'uuid': 'd54f173e-82ca-4efa-9854-0d95737cc08c',
      'thumb':
          'https://stream.dsfootball.io/posts/d7dae68b-39cc-4aeb-8181-433c6392852c-1689529547710/thumbnails/00001.png',
      'contentCategory': 'Game',
      'video':
          'https://stream.dsfootball.io/posts/d7dae68b-39cc-4aeb-8181-433c6392852c-1689529547710/index.m3u8',
      'postedAt': '2023-07-16T17:42:48+0000',
      'id': '27513206',
      'title': 'recuperação rápida no erro dos zagueiros',
      'numLikes': 0,
      'numComments': 1,
      'evaluation': {'composition': 0}
    }
  ]
};
