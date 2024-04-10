// Copyright © 2022 Flipp. All rights reserved.

import Foundation
import UIKit
import FlippShopperSDK

class ArticleViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let containerView = UIView()
    private let textView = UITextView()
    private var webview: FPWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FPShopperSDK.shared.configure(
            .dev,
            siteId: "1192075",
            zoneIds: ["260678"],
            publisherName: "wishabi-test-publisher",
            domain: "http://www.myapp.com",
            contentCode: "flipp-sdk")

        webview = FPWebView(viewController: self)
        webview.nativeXdelegate = self
        
        webview.setContext(contextList: ["Cheese", "Onions", "Turkey"], contextUrl: "https://myrecipesite.com/1111")
        
        textView.text = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse vestibulum commodo eros, a congue nunc tempus nec. Nullam scelerisque ante a mi blandit facilisis. Nunc mattis maximus sodales. Nullam sem nisi, pellentesque quis lacus in, volutpat gravida arcu. Maecenas scelerisque, enim id pretium cursus, leo leo pharetra leo, ut mattis elit massa sit amet nibh. Aliquam vel lobortis mauris, sed tempor odio. Nullam tristique dolor nec vulputate tristique. Nam vestibulum velit orci, id egestas sem lobortis eget. Nam hendrerit, turpis sit amet pretium iaculis, urna tellus tincidunt risus, eget euismod ex urna nec mauris. Curabitur vel suscipit arcu. Quisque auctor quam leo, eu tincidunt metus lobortis ut. Sed ac nisi ac dolor consequat pellentesque ut consectetur metus. Pellentesque quis lorem eu ex dapibus tincidunt ac at erat.

Donec non faucibus ex. Curabitur commodo rhoncus lacus et rhoncus. Integer et quam finibus, auctor nibh vel, accumsan elit. Suspendisse eleifend, elit quis rutrum auctor, odio velit tincidunt sapien, facilisis aliquet odio mi sit amet ante. Quisque lacinia ultrices finibus. Ut euismod in sapien at tincidunt. Morbi luctus turpis non consequat vulputate. Morbi pulvinar sed mauris eu hendrerit. Praesent eu aliquam lectus. Nunc at aliquet ligula, quis accumsan eros. Donec risus sapien, pretium ut dolor ac, ultricies dictum lorem. Ut et pharetra nibh. Etiam a sem vitae nulla ultrices mattis. Sed pharetra, sapien sed aliquam facilisis, lacus arcu vehicula elit, ullamcorper consectetur nulla tellus interdum velit. Phasellus blandit est at ante feugiat dignissim.

Cras eget tortor auctor erat varius molestie. Mauris enim nisi, condimentum vitae suscipit sit amet, aliquet a tellus. Phasellus malesuada, libero vel gravida suscipit, odio lorem pharetra nulla, a auctor enim enim sed nunc. Ut lacus eros, facilisis id dolor ac, vestibulum aliquam leo. Etiam auctor ante venenatis massa vulputate facilisis. Praesent euismod at nunc eget pulvinar. Suspendisse lorem sem, sollicitudin ut sem eu, viverra tempus justo.

Sed finibus pellentesque enim sit amet commodo. Aliquam suscipit eget tortor ac egestas. Nullam turpis erat, bibendum vel vehicula ac, bibendum ac libero. Aliquam pulvinar massa vel orci commodo, a ultricies purus egestas. Sed ut tempor dui. Praesent aliquet placerat massa, sed congue elit molestie quis. Praesent gravida purus nisl, a pretium sapien blandit at. Sed sit amet eros quis nibh finibus viverra. Morbi sit amet mi eu orci tincidunt consequat. Praesent porttitor ex in felis fringilla fermentum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aenean euismod nunc non augue convallis, vitae lacinia leo facilisis. In sagittis suscipit est et vehicula. Donec turpis risus, facilisis at dui eu, volutpat sagittis leo.

Praesent condimentum elit ac diam consectetur, eget tempus nisl suscipit. Praesent fringilla facilisis luctus. Praesent ultricies massa sed rutrum lobortis. Donec sed nisl diam. Etiam varius rhoncus orci sed cursus. Nam quis turpis maximus, lacinia tortor sit amet, vestibulum mauris. Morbi et porttitor velit. Sed ac eros aliquam, bibendum mi sed, congue augue.

Sed mollis mi nisl, non auctor purus blandit at. Donec vulputate tincidunt consequat. Nulla sollicitudin mi finibus magna sollicitudin, malesuada ultrices elit consequat. Nulla facilisi. Sed pulvinar, nisi a ullamcorper imperdiet, nisl diam dapibus nunc, at blandit est quam ac neque. Donec lacus nisi, elementum nec orci nec, vulputate maximus lacus. Phasellus vel mi vel sem blandit convallis at et diam. Quisque ac eros diam. Quisque lectus neque, bibendum vitae nisl vitae, iaculis tempus lacus. Duis sit amet lorem tellus. Vivamus sit amet lorem id dolor molestie ornare. Vivamus at dapibus orci. Integer cursus felis et odio mollis, ut fermentum ante viverra. Ut ante ipsum, maximus eget gravida ut, imperdiet in tortor. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae;

Donec ac massa porttitor, accumsan massa et, commodo lectus. In eros massa, pretium sit amet velit ut, aliquam mollis leo. Praesent elementum nibh et ligula molestie, id volutpat lorem faucibus. In sit amet diam non dui mattis cursus ut non lectus. Maecenas suscipit tristique nunc id pharetra. Nullam pharetra finibus lorem, ac tempor diam malesuada non. Aliquam blandit neque non velit luctus consequat. Duis iaculis ultrices augue eu rutrum. Ut turpis lacus, tristique vitae vestibulum non, lacinia id magna. Curabitur eget blandit dolor, vel eleifend neque. Nunc mauris diam, consequat id erat eget, ultrices ullamcorper diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Aenean sodales mattis ante, nec sagittis augue dignissim eget. Pellentesque sodales leo vel metus lobortis, ac lacinia mauris iaculis.

Vestibulum rhoncus suscipit quam sit amet volutpat. Nam auctor facilisis vehicula. Phasellus non massa eget nisl elementum auctor. Praesent eleifend leo volutpat mauris iaculis, quis fermentum ipsum ultrices. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam et venenatis libero. Sed sapien elit, tempus id neque in, elementum pulvinar eros. Vestibulum quis nisi mi. Sed ac est vestibulum, ultrices ipsum id, congue mi. Nam lectus est, tincidunt sit amet arcu sit amet, placerat consectetur mi. Pellentesque pellentesque ipsum sit amet erat interdum malesuada. Donec condimentum tellus quis ligula viverra, vel facilisis dui sagittis. Nulla facilisi. Nullam at felis vel odio gravida volutpat ac id purus. In sodales erat dui, vitae faucibus nibh condimentum vitae.

Curabitur fermentum libero pulvinar eleifend sodales. In interdum nulla metus, ut gravida felis faucibus vel. Cras sed erat nec dui varius varius a ut elit. Aliquam aliquam tincidunt metus, at sollicitudin est tristique eget. Maecenas metus urna, faucibus at ultricies porta, tempor et ligula. Quisque non rhoncus arcu, sed aliquam neque. Integer volutpat pellentesque aliquet. Pellentesque pulvinar at neque sed fringilla. Maecenas fringilla, justo non ornare cursus, neque turpis pellentesque nisi, nec vehicula metus quam pharetra dui. Vivamus eget pharetra enim. Nulla placerat varius ex eu suscipit. Proin ornare dapibus tempor. Etiam a diam nunc. Etiam ullamcorper scelerisque lacus, sed dictum neque malesuada vel. Aliquam nec nibh ipsum. Phasellus sodales ornare ultricies.

Sed justo mi, iaculis in porttitor vel, hendrerit sed massa. In egestas mi ex. Aliquam varius arcu sem, id tincidunt nibh volutpat nec. In feugiat magna eget luctus malesuada. Praesent rhoncus condimentum dolor et vestibulum. Nullam eget orci dapibus, iaculis ante eu, pretium sem. Vivamus blandit congue ipsum. Aliquam vestibulum urna sed sagittis ultrices. Duis tempus, nisl nec feugiat condimentum, quam diam pretium nibh, nec condimentum nisl augue non velit. In consequat enim tortor, sed fermentum odio pharetra eu. Donec sit amet efficitur lorem.
"""
        setupConstraints()
    }

    private func setupConstraints() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        webview.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(textView)
        containerView.addSubview(webview)
        let guide = scrollView.contentLayoutGuide
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true

        containerView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
        containerView.backgroundColor = .yellow

        textView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 1500).isActive = true

        webview.topAnchor.constraint(equalTo: textView.bottomAnchor).isActive = true
        webview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        webview.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        webview.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true    }
}

extension ArticleViewController: NativeXDelegate {

    func didTap(item: String) {
    }

    func didFinishLoad(contentHeight: Double) {}

    func didFailToLoad(error: Error) {
        let alert = UIAlertController(title: nil, message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}
