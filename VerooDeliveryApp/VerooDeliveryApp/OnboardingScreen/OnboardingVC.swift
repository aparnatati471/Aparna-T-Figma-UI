import UIKit

class OnboardingVC: UIViewController, CoordinatorBoard {
    
    // MARK: Outlets
    @IBOutlet weak var onBoardingCollectionView: UICollectionView!
    @IBOutlet weak var btnSkip: BottomButtons!
    @IBOutlet weak var btnNext: BottomButtons!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: Variables
    var contents = [OnboardingDataClass]()
    var currentPage = 0
    weak var onboardingCoordinator: AppCoordinator?
    
    // MARK: Overriden Method
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.viewBackgroundColor
       // pageControl.numberOfPages = contents.count
    }
    
    // IBActions
    @IBAction func skipClicked(_ sender: BottomButtons) {
        onboardingCoordinator?.navigateToAutheticator()
    }
    
    @IBAction func nextClicked(_ sender: BottomButtons) {
        currentPage += 1
        if (currentPage >= Data.onBoardingData.count) {
            onboardingCoordinator?.navigateToAutheticator()
            UserDefaults.standard.hasOnboarded = true
        } else {
            let index = IndexPath(item: currentPage, section: 0)
            print(index)
            pageControl.currentPage = currentPage
            onBoardingCollectionView.isPagingEnabled = false
            onBoardingCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            onBoardingCollectionView.isPagingEnabled = true
        }
    }
    
}

// MARK: OnboardingVC Extension which conforms UICollectionViewDataSource
extension OnboardingVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Data.onBoardingData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = onBoardingCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.onboardingCell.identifier, for: indexPath) as? OnboardingCell else { return UICollectionViewCell() }
        OnboardingCell.cellConfiguration(cell: cell, indexPath: indexPath)
        return cell
    }
    
}

// MARK: OnboardingVC Extension which conforms UICollectionViewDelegateFlowLayout
extension OnboardingVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.currentPage = currentPage
    }

}
